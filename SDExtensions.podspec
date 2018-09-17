#
#  Be sure to run `pod spec lint SDExtensions.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = "SDExtensions"
    s.version      = "0.0.2"
    s.summary      = "SDExtensions扩展"
    s.description  = "SDExtensions的扩展"
    s.homepage     = "https://github.com/SlowDony/SDExtensions"
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { "slowdony" => "435574793@qq.com" }
    s.social_media_url   = "https://weibo.com/u/2428779285"
    s.source_files  = 'SDExtensions/**/*.{h,m}'
    s.source       = { :git => "https://github.com/SlowDony/SDExtensions.git", :tag => "#{s.version}" }
    s.ios.deployment_target = '8.0'
    s.frameworks = 'Foundation', 'UIKit','XCTest'
    s.user_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks' }

end
