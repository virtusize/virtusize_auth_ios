# Virtusize Auth SDK for iOS

## Description

The Virtusize Auth SDK for iOS is a closed-source library that handles the SNS authentication process for our [Virtusize iOS Integration](https://github.com/virtusize/integration_ios).



## Requirements

- iOS 13.0+
- Xcode 12+
- Swift 5.0+



## Getting Started

### 1. Installation

#### CocoaPods

Install using the [CocoaPods](https://cocoapods.org/) dependency manager. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Virtusize SDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

target '<your-target-name>' do
pod 'VirtusizeAuth', '~> 1.1.0'
end
```

Then, run the following command:

```bash
$ pod repo update
$ pod install
```

#### Swift Package Manager

1. In Xcode, select **File** > **Swift Packages** > **Add Package Dependency...** and enter `https://github.com/virtusize/virtusize_auth_ios.git` as the repository URL.
2. Select a minimum version of `1.1.0`
3. Click **Next**



### 2. Create a Custom URL Scheme for Virtuzize SNS Auth

The SNS authentication flow requires switching to a SFSafariViewController, which will load a web page for the user to login with their SNS account. In order to return the login response from a SFSafariViewController to your app, a custom URL scheme must be defined.

You must register a URL type and send it to the `VirtusizeAuth.setAppBundleId` method.

**(1) Register a URL type**

In Xcode, click on your project's **Info** tab and select **URL Types**.

Add a new URL type and set the URL Schemes and identifier to `com.your-company.your-app.virtusize`

[![Screen Shot 2021-11-10 at 21 36 31](https://user-images.githubusercontent.com/7802052/141114271-373fb239-91f8-4176-830b-5bc505e45017.png)](https://user-images.githubusercontent.com/7802052/141114271-373fb239-91f8-4176-830b-5bc505e45017.png)

**(2) Set the app's bundle ID**

In the App Delegate's `application(_:didFinishLaunchingWithOptions:)` method, call the `VirtusizeAuth.setAppBundleId` method with the app's bundle ID.

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	// Virtusize initialization omitted for brevity

	// Set the app bundle ID
	VirtusizeAuth.setAppBundleId("com.your-company.your-app")

	return true
}
```

**❗IMPORTANT**

1. The URL type must include your app's bundle ID and **end with .virtusize**.
2. If you have multiple app targets, add the URL type for all of them.



### Enable Virtusize SNS Login for your WebView app

Use either of the following methods to enable Virtusize SNS login

#### Method 1: Use the VirtusizeWebView

##### Replace `WKWebview` that loads Virtusize with `VirtusizeWebView`

To enable Virtusize SNS login on the web version of Virtusize integration inside your web view, please use this method:

1. If you have built your UI purely with UIKit, replace your `WKWebView` with **`VirtusizeWebView`** in your Swift file. If you use the WKWebViewConfiguration object to configure your web view, please access it from the closure like the example below.

   - Swift

   ```diff
   - var webView: WKWebView
   + var webView: VirtusizeWebView
   ```

   ```swift
   webView = VirtusizeWebView(frame: .zero) { configuration in
       // access the WKWebViewConfiguration object here to customize it
       
       // If you want to allow cookie sharing between multiple VirtusizeWebViews,
       // assign the same WKProcessPool object to configuration.processPool
       configuration.processPool = WKProcessPool()
   }
   ```

2. If you have built your UI with Xcode's Interface Builder, make sure that you set the Custom Class of your web view to **`VirtusizeWebView`** in the Identity inspector.

   - Swift

   ```diff
   - @IBOutlet weak var webview: WKWebView!
   + @IBOutlet weak var webview: VirtusizeWebView!
   ```

   - Interface Builder

     ![img](https://user-images.githubusercontent.com/7802052/121308895-87e3b500-c93c-11eb-8745-f4bf22bccdba.png)

#### Method 2: Use WKWebView

##### Step 1: Execute JavaScript code in your WKWebView to enable SNS buttons in Virtusize

```
yourWebView.evaluateJavaScript("window.virtusizeSNSEnabled = true;")
```

##### Step 2: Make sure your view controller confirms the `WKUIDelegate` and implement the code below

```swift
class YourViewController: UIViewController {

	private var yourWebView: WKWebView!

	override func viewDidLoad() {
		super.viewDidLoad()
    // ... other code

    yourWebView.uiDelegate = self
	}
}

extension YourViewController: WKUIDelegate {
	func webView(
		_ webView: WKWebView,
		createWebViewWith configuration: WKWebViewConfiguration,
		for navigationAction: WKNavigationAction,
		windowFeatures: WKWindowFeatures
	) -> WKWebView? {
		guard let url = navigationAction.request.url else {
			return nil
		}

		if VirtusizeURLCheck.isExternalLinkFromVirtusize(url: url.absoluteString) {
			UIApplication.shared.open(url, options: [:])
			return nil
		}

		if VirtusizeAuth.isSNSAuthURL(viewController: self, webView: webView, url: url) {
			return nil
		}

		if navigationAction.targetFrame == nil && VirtusizeURLCheck.isLinkFromSNSAuth(url: url.absoluteString) {
			let popupWebView = WKWebView(frame: webView.frame, configuration: configuration)
			popupWebView.uiDelegate = self
			webView.addSubview(popupWebView)
			popupWebView.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				popupWebView.topAnchor.constraint(equalTo: webView.topAnchor),
				popupWebView.leadingAnchor.constraint(equalTo: webView.leadingAnchor),
				popupWebView.trailingAnchor.constraint(equalTo: webView.trailingAnchor),
				popupWebView.bottomAnchor.constraint(equalTo: webView.bottomAnchor)
			])
			return popupWebView
		}
    
    // The rest of your code ... 

		return nil
	}

	func webViewDidClose(_ webView: WKWebView) {
		webView.removeFromSuperview()
	}
}
```
