Pod::Spec.new do |spec|

  spec.name = "YMKit"
  spec.version = "3.0.0"
  spec.summary = "YMKit is a collection of tools that make development of iOS apps quicker and easier."
  spec.homepage = "https://kit.ym.dev/"
  spec.license = "Apache License, version 2"
  spec.author = "Yakov Manshin"
  spec.social_media_url = "https://twitter.com/yakovmanshin"
  spec.module_name = "YMKit"
  spec.swift_version = "5.0"
  spec.platform = :ios, "8.0"
  spec.source = {
      :git => "https://github.com/yakovmanshin/YMKit.git",
      :tag => "v#{spec.version}"
  }
  spec.source_files = "YMKit/**/*.swift"

end
