Pod::Spec.new do |s|
  s.name         = "UIAlertView-Blocks"
  s.version      = "0.1"
  s.summary      = "A category for UIAlertView which allows you to use blocks to handle the pressed button events rather than implementing a delegate."

  s.description  = <<-DESC
                   You dont need a delegate. To have one button only, set the right button title to nil.
                   Actions are optional. To not have one, set it to nil.
                   LIMITATIONS.
                   You can only have one or two buttons in the alert view. If you want three or more buttons you will have to revert back to the old way.
                   
                   DESC
                   
  s.homepage     = "https://github.com/rsaunders100/UIAlertView-Blocks"
  s.author       = { "Rob Saunders" => "rsaunders100@gmail.com" }
  s.platform     = :ios, '4.3'
  s.source       = { :git => "https://github.com/rsaunders100/UIAlertView-Blocks.git"}
  s.source_files = 'UIAlertView+Blocks.{h,m}'
  s.requires_arc = false
end