# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module ToSlugParam
  VERSION = "1.8"
end

Gem::Specification.new do |spec|
  spec.name          = 'to_slug_param'
  spec.version       = ToSlugParam::VERSION
  spec.authors       = ['Ilya N. Zykin']
  spec.email         = ['zykin-ilya@ya.ru']
  spec.description   = %q{ Convert strings and symbols to slug param }
  spec.summary       = %q{ Transliteration + Parameterization for slugs building }
  spec.homepage      = 'https://github.com/TheOpenCMS/to_slug_param'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '>= 0', '< 14.0'
  spec.add_runtime_dependency 'rails-i18n', '>= 0', '< 7.0'
  spec.add_runtime_dependency 'rails', '>= 4.0.3', '< 7.0'
  spec.add_runtime_dependency 'stringex', '2.8.5'
end
