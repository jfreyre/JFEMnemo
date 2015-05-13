#
# Be sure to run `pod lib lint JFEMnemo.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JFEMnemo"
  s.version          = "0.1.0"
  s.summary          = "JFEMnemo is an iOS version of the ruby gem rufus-mnemo."
  s.description      = <<-DESC
                         With JFEMnemo you can easily turns integers into japanese sounding words and vice versa (ruby).

                         exemple:
                         - 76955 becomes haruka
                         - 141260 becomes kotoba
                       DESC
  s.homepage         = "https://github.com/jfreyre/JFEMnemo"
  s.license          = 'MIT'
  s.author           = { "Jerome Freyre" => "jerome.freyre@gmail.com" }
  s.source           = { :git => "https://github.com/jfreyre/JFEMnemo.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/j_freyre'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  #s.resource_bundles = {
  #  'JFEMnemo' => ['Pod/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
