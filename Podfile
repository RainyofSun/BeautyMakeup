platform :ios, '13.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/bytedance/cocoapods_sdk_source_repo.git'
use_frameworks!

# 定义公共库
def CommonPods
  pod 'CocoaLumberjack/Swift'
  pod 'HandyJSON', '5.0.2'
  pod 'Moya', '15.0.0'
  pod 'SnapKit', '5.6.0'
#  pod 'WCDB.swift', '2.0.1'
  pod 'SwiftyJSON', '4.3.0'
  pod 'Toast-Swift', '5.0.1'
#  pod 'lottie-ios', '3.4.1'
  pod 'Reachability', '3.2'
  pod 'Kingfisher', '7.9.1'
  pod 'MJRefresh', '3.7.5'
  pod 'LLSegmentViewController', '1.1.13'
  pod 'TZImagePickerController', '3.8.3'
  pod 'YBImageBrowser', '3.0.9'
  pod 'YBImageBrowser/Video'
  pod 'KeychainAccess', '4.2.2'
#  pod 'FLAnimatedImage', '1.0.17'
#  pod 'SDWebImageFLPlugin', '0.6.0'
  # 截长图
  pod 'ZSSnapshotKit', '0.0.2'
#  pod 'SVProgressHUD', '2.2.5'
  pod 'EmptyDataSet-Swift', '5.0.0'
  pod 'SHFullscreenPopGestureSwift', '1.2.1'
#  pod 'KTVHTTPCache', '2.0.1'
end

# 主工程引用的库
def HostAPPPods
  # 播放器 https://github.com/renzifeng/ZFPlayer
#  pod 'ZFPlayer', '4.1.4'
#  pod 'ZFPlayer/ControlView'
#  pod 'ZFPlayer/AVPlayer'
  # VGA
#  pod 'QGVAPlayer', '1.0.19'
  pod 'CryptoSwift', '~> 1.5.1', :inhibit_warnings => true
  # IAP
  pod 'SwiftyStoreKit', '0.16.1'
  # cache
#  pod 'Cache', '6.0.0'
  # Agroa
#  pod 'AgoraRtm_Special_iOS', '1.4.9.203'
  pod 'AgoraRtcEngine_iOS', '= 4.2.1', :inhibit_warnings => true
  # RongCloudIM
#  pod 'RongCloudIM/IMKit', '5.6.4'
end

target 'BeautyMakeup' do
  CommonPods()
  HostAPPPods()
end

post_install do |installer|
  
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
  
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    config.build_settings['CODE_SIGN_IDENTITY'] = ''
  end
end
