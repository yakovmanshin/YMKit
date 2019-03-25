Pod::Spec.new do |spec|
  
  spec.name = "YMKit"
  spec.version = "0.10.1"
  spec.summary = "YMKit is a collection of helpful tools for iOS app development."
  spec.homepage = "https://ykvm.com/ymkit"
  spec.license = "Apache License, version 2"
  spec.author = "Yakov Manshin"
  spec.social_media_url = "https://twitter.com/yakovmanshin"
  spec.module_name = "YMKit"
  spec.swift_version = "5.0"
  spec.platform = :ios, "8.0"
  spec.source = { :git => "https://github.com/yakovmanshin/YMKit.git", :tag => "v#{spec.version}" }
  spec.source_files = "YMKit/**/*.{h,m,swift}"
  
end