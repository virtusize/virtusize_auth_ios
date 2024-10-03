Pod::Spec.new do |spec|
  spec.name         = "VirtusizeAuth"
  spec.version      = "1.1.3"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.summary      = "Virtusize Auth SDK for iOS"
  spec.homepage     = "https://www.virtusize.com/"
  spec.author       = { "Virtusize" => "client.support@virtusize.com" }
  spec.source       = { :git => "https://github.com/virtusize/virtusize_auth_ios.git", :tag => "#{spec.version}" }

  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5"

  spec.static_framework = true
  spec.vendored_frameworks = "VirtusizeAuth.xcframework", "VirtusizeCore.xcframework"
  spec.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  spec.resource_bundles = { "#{spec.module_name}Resources" => ["VirtusizeAuthWrapper/Resources/PrivacyInfo.xcprivacy"] }
end
