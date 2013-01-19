# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "jam_script_highlighter/version"

Gem::Specification.new do |s|
  s.name        = 'jam_script_highlighter'
  s.version     = JamScriptHighlighter::VERSION::STRING
  s.authors     = ["Adam Phillips"]
  s.description = 'Simple JamScript highlighter'
  s.summary     = "jam_script_highlighter-#{s.version}"
  s.email       = ''
  s.homepage    = ""

  s.platform    = Gem::Platform::RUBY

  s.add_dependency 'pdfkit'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'guard-minitest'
  s.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  s.add_development_dependency 'hirb'
  s.add_development_dependency 'wirble'
  s.add_development_dependency 'cover_me'

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end