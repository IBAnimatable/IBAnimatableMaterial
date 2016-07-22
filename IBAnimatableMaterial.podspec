Pod::Spec.new do |s|
s.name         = "IBAnimatableMaterial"
s.version      = "0.5"
s.summary      = "Matrrial Design Addons for IBAnimatable. Design and prototype UI, interaction, navigation, transition and animation for App Store ready Apps in Interface Builder with IBAnimatable."
s.homepage     = "https://github.com/JakeLin/IBAnimatableMaterial"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "Jake Lin" => "JakeLinAu@gmail.com" }
s.platform     = :ios, '8.0'
s.source       = { :git => "https://github.com/JakeLin/IBAnimatableMaterial.git", tag: "#{s.version}" }
s.framework = "UIKit"
s.dependency 'IBAnimatable'
s.dependency 'Material'
s.source_files = "IBAnimatableMaterial/*.swift"
end
