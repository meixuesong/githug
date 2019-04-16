# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "githug/version"

Gem::Specification.new do |s|
  s.name        = "mygithug"
  s.version     = Githug::VERSION
  s.authors     = ["Gary Rennie & Mei Xuesong"]
  s.email       = ["meixuesong@gmail.com"]
  s.homepage    = "https://github.com/meixuesong/githug"
  s.summary     = %q{An interactive way to learn git in your workplace.}
  s.description = %q{An interactive way to learn git.}

  s.rubyforge_project = "mygithug"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~>2.8.0"

  s.add_dependency "grit", "~>2.3.0"
  s.add_dependency "thor", "~>0.14.6"
  s.add_dependency "rake", "<11"
end