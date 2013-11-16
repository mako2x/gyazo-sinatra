require 'digest/md5'
require 'sdbm'
require 'bundler/setup'
require 'sinatra'
require File.expand_path(File.dirname(__FILE__)) + '/app.rb'

run Gyazo::Controller
