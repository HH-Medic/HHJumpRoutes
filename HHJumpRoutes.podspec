Pod::Spec.new do |s|

  s.name         = "HHJumpRoutes"
  s.version      = "1.0.7"
  s.summary      = "解决多个组件之间通过URL scheme调用弹出控制器"
  s.homepage     = "https://github.com/HH-Medic/HHJumpRoutes"
  s.license      = "MIT"
  s.author             = { "_Ashen" => "shmilyshijian@foxmail.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/HH-Medic/HHJumpRoutes.git", :tag => s.version}

  s.source_files  = "FreeController/Resources"
 
  s.dependency "HHJLRoutes"

end
