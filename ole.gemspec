# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ole/version"

Gem::Specification.new do |s|
  s.name        = "ole"
  s.version     = Ole::VERSION
  s.authors     = ["Josh McArthur"]
  s.email       = ["joshua.mcarthur@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Noisily trumpet your deploys}
  s.description = %q{This gem includes capistrano tasks and a sintra app to play a dulcet tune upon a successful deploy}

  s.rubyforge_project = "ole"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
