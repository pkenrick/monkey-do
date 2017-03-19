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
  app.name = 'monkey_do'

  app.identifier = 'com.firstdoman.firstapp'
  app.codesign_certificate = 'iPhone Developer: William Kenrick (Y5NZ3V5728)'
  app.provisioning_profile = '/Users/paulkenrick/Projects/personal/rubymotion/book/boxy/firstprofile.mobileprovision'
end
