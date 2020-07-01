#
# Be sure to run `pod lib lint JSViewTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JSViewTools'
  s.version          = '0.1.2'
  s.summary          = 'A short description of JSViewTools.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/canlanrensheng/JSViewTools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jinshan zhang' => '15168288729@163.com' }
  s.source           = { :git => 'https://github.com/canlanrensheng/JSViewTools', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JSViewTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JSViewTools' => ['JSViewTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
