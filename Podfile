# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'NewsAgregator' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

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
  pod 'Viper', :git => 'https://github.com/stas-ios/Viper.git', :tag => 'v0.1.0'
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
