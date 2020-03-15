
Pod::Spec.new do |s|
  s.name             = 'LZSwiftAppDelegateKit'
  s.version          = '0.0.1'
  s.summary          = 'LZSwiftAppDelegateKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/chenjianlei'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenjianlei' => 'woshixiaolei@qq.com' }
  s.source           = { :git => 'https://github.com/chenjianlei/LZSwiftAppDelegateKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_versions = ['4.0', '4.2', '5.0']

  s.source_files = 'LZSwiftAppDelegateKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LZSwiftAppDelegateKit' => ['LZSwiftAppDelegateKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'UserNotifications'
  # s.dependency 'AFNetworking', '~> 2.3'
end
