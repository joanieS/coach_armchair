# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Coach'
  app.identifier = '892LRG96JN.com.rubymotion.*'
  app.icons << 'icon.png'
  app.codesign_certificate = 'iPhone Developer: Joan Soskin (USK5D244GU)'
  app.provisioning_profile = '/Users/joansoskin/Documents/flashstarts/development/provisioning_profiles/rubymotion.mobileprovision'
end