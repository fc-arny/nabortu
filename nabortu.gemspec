# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nabortu/version'

Gem::Specification.new do |spec|
  spec.name          = 'nabortu'
  spec.version       = Nabortu::VERSION
  spec.authors       = ['fc_arny']
  spec.email         = ['arthur.shcheglov@gmail.com']
  spec.summary       = %q{Ruby wrapper for work with SOAP service nabortu.ru(http://webservices.nabortu.ru/WebServices/Service.asmx)}
  spec.description   = %q{Ruby wrapper for work with SOAP service nabortu.ru(http://webservices.nabortu.ru/WebServices/Service.asmx)}
  spec.homepage      = 'http://martsoft.ru/lab/nabortu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
