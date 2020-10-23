require "json"
version = JSON.parse(File.read("package.json"))["version"]

Pod::Spec.new do |s|
  s.name         = "RNIronSource"
  s.version      = version
  s.summary      = "RNIronSource"
  s.description  = <<-DESC
                  Iron Source SDK React Native bridge
                   DESC
  s.homepage     = "https://github.com/squaretwo/react-native-iron-source"
  s.license      = "MIT"
  s.author       = { "Ben Yee" => "benyee@gmail.com" }
  s.platform     = :ios, "7.0.3.0"
  s.source       = { :git => "https://github.com/MammothMedia/react-native-iron-source", tag: "v" + s.version.to_s }
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.dependency "React"
  s.dependency 'IronSourceSDK','7.0.3.0'
  s.dependency 'IronSourceAdColonyAdapter','4.3.4.1'
  s.dependency 'IronSourceAdMobAdapter','4.3.17.1'
  s.dependency 'IronSourceAppLovinAdapter','4.3.19.1'
  s.dependency 'IronSourceFacebookAdapter','4.3.20.1'
  s.dependency 'IronSourceHyprMXAdapter','4.1.7.0'
  s.dependency 'IronSourceUnityAdsAdapter','4.3.5.1'
  s.dependency 'IronSourceVungleAdapter','4.3.7.1'
  
  s.subspec "Core" do |ss|
    ss.source_files  = "ios/**/*.{h,m}"
  end

  if defined?($RNIronSourceAsStaticFramework)
    Pod::UI.puts "#{s.name}: Using overridden static_framework value of '#{$RNIronSourceAsStaticFramework}'"
    s.static_framework = $RNIronSourceAsStaticFramework
  else
    s.static_framework = false
  end

end
