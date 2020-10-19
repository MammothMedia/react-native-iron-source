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
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wowmaking/react-native-iron-source", tag: "v" + s.version.to_s }
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.dependency "React"
  s.dependency "IronSourceSDK", "7.0.3.0"

  s.subspec "Core" do |ss|
    ss.source_files  = "ios/**/*.{h,m}"
  end
  s.subspec "AdColony" do |ss|
    ss.dependency         "IronSourceAdColonyAdapter", "4.3.4"
  end
  s.subspec "Admob" do |ss|
    ss.dependency         "IronSourceAdMobAdapter", "4.3.17"
  end
  s.subspec "AppLovin" do |ss|
    ss.dependency         "IronSourceAppLovinAdapter", "4.3.19"
  end
  s.subspec "Facebook" do |ss|
    ss.dependency         "IronSourceFacebookAdapter", "4.3.20"
  end
  s.subspec "UnityAds" do |ss|
    ss.dependency         "IronSourceUnityAdsAdapter", "4.3.5"
  end
  s.subspec "Vungle" do |ss|
    ss.dependency         "IronSourceVungleAdapter", "4.3.8"
  end

  if defined?($RNIronSourceAsStaticFramework)
    Pod::UI.puts "#{s.name}: Using overridden static_framework value of '#{$RNIronSourceAsStaticFramework}'"
    s.static_framework = $RNIronSourceAsStaticFramework
  else
    s.static_framework = false
  end

end
