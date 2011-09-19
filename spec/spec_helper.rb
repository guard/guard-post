require 'rubygems'
ENV["GUARD_ENV"] = 'test'

$:.unshift File.expand_path("../../lib", __FILE__)

require 'guard/post'
require "guard/watcher"
require "guard/ui"
