# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "jam_script/version"

Gem::Specification.new do |s|
  s.name        = 'jam_script'
  s.version     = JamScript::VERSION::STRING
  s.authors     = ["Adam Phillips"]
  s.description = 'Think markdown for the Real Book'
  s.summary     = "jam_script-#{s.version}"
  s.email       = ''
  s.homepage    = ""

  s.platform    = Gem::Platform::RUBY

  s.add_runtime_dependency 'treetop', '~> 1.4.1'
  
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'guard-minitest'

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end