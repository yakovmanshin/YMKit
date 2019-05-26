Pod::Spec.new do |spec|

  spec.name = "YMKit"
  spec.version = "0.15.1"
  spec.summary = "YMKit is a collection of tools for quicker and easier development of iOS apps."
  spec.homepage = "https://ym.dev/kit"
  spec.license = "Apache License, version 2"
  spec.author = "Yakov Manshin"
  spec.social_media_url = "https://twitter.com/yakovmanshin"
  spec.module_name = "YMKit"
  spec.swift_version = "5.0"
  spec.platform = :ios, "8.0"
  spec.source = { :git => "https://github.com/yakovmanshin/YMKit.git", :tag => "v#{spec.version}" }
  spec.source_files = "YMKit/**/*.{h,m,swift}"

end
