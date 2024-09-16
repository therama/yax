Pod::Spec.new do |s|
    s.name         = "YetAnotherXcframework"
    s.version      = "2.0.0"
    s.summary      = "A brief description of framework project."
    s.description  = <<-DESC
    An extended description of framework project.
    DESC
    s.homepage     = "https://github.com/therama/yax.git"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2024
                   Permission is granted to...
                  LICENSE
                }
    s.author             = { "Raffi Manissalian" => "raffi.manissalian@theoplayer.com" }
    s.source       = { :git => "https://github.com/therama/yax.git", :tag => "#{s.version}" }
    s.vendored_frameworks = "Builds/#{s.version}/YetAnotherXcframework.xcframework"
    s.platform = :ios
    s.swift_version = "5.0"
    s.ios.deployment_target  = '17.0'
end