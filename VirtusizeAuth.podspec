Pod::Spec.new do |spec|
  spec.name         = "VirtusizeAuth"
  spec.version      = "0.0.1"
  spec.summary      = "Virtusize Auth SDK for iOS"
  spec.homepage     = "https://www.virtusize.com/"
  spec.author       = { "Virtusize" => "client.support@virtusize.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = "10.3"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/virtusize/virtusize_auth_ios.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "VirtusizeAuth.xcframework"

end
