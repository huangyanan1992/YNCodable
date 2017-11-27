Pod::Spec.new do |s|
  s.name         = "YNCodable"
  s.version      = "1.0"
  s.summary      = "YNCodable"
  s.description  = "A description of YNCodable."
  s.homepage     = "https://github.com/huangyanan1992"
  s.license      = { :type => 'Commercial', :text => '© 2017年 Huang Yanan.' }
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "huangyanan" => "huangyanan" }
  # Or just: s.author    = "huangyanan1992"
  # s.authors            = { "huangyanan1992" => "18001376260@163.com" }
  # s.social_media_url   = "http://twitter.com/huangyanan1992"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "9.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => 'https://github.com/huangyanan1992/YNCodable.git', :tag => s.version }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.



  s.source_files = "YNCodable/**/*.{swift}"

end
