#\ -p 9494

require 'bundler/setup'
Bundler.require
require File.join(File.dirname(__FILE__), 'ole')

run Ole
