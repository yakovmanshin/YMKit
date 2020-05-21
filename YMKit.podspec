Pod::Spec.new do |spec|

  spec.name = "YMKit"
  spec.version = "3.1.0"
  spec.summary = "YMKit is a collection of tools for quicker and easier development of iOS apps."
  spec.homepage = "https://kit.ym.dev/"
  spec.license = "Apache License, version 2"
  spec.author = "Yakov Manshin"
  spec.module_name = "YMKit"
  spec.swift_version = "5.0"
  spec.platform = :ios, "8.0"
  spec.source = {
      :git => "https://github.com/yakovmanshin/YMKit.git",
      :tag => "v#{spec.version}"
  }
  spec.source_files = "YMKit/**/*.swift"

end
