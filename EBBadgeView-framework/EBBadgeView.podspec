Pod::Spec.new do |s|
  s.name = 'EBBadgeView'
  s.version = '1.0.1'
  s.summary = 'A library helps UIView and UITabBar to show custom badgeView'
  s.license = 'MIT'
  s.authors = {"kaychn126"=>"kaychn@126.com"}
  s.homepage = 'https://github.com/kaychn126/EBBadgeView'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/kaychn126/EBBadgeView.git", :tag => s.version.to_s }

  s.ios.deployment_target    = '7.0'
  s.ios.preserve_paths       = 'ios/EBBadgeView.framework'
  s.ios.public_header_files  = 'ios/EBBadgeView.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/EBBadgeView.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/EBBadgeView.framework'
end
