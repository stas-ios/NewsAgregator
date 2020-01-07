plugin 'cocoapods-binary'
platform :ios, '11.0'

use_frameworks!
all_binary!
target 'NewsAgregator' do

  # Pods for NewsAgregator
  pod 'Swinject'
  pod 'RxAlamofire'
  pod 'RxCocoa'
  pod 'XMLCoder'
  pod 'RxKingfisher'
  pod 'RealmSwift'
  pod 'Firebase/Analytics'
  pod 'Crashlytics'
  
  # Мой pod с базовыми классами
  pod 'Viper', :git => 'https://github.com/stas-ios/Viper.git', :tag => 'v0.1.0', :binary => false
  # pod 'Viper', :path => '../Viper'

  target 'NewsAgregatorTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NewsAgregatorUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf-with-dsym'
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
    end
  end
end
