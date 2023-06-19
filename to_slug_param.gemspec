# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module ToSlugParam
  VERSION = '1.8'
end

Gem::Specification.new do |spec|
  spec.name          = 'to_slug_param'
  spec.version       = ToSlugParam::VERSION
  spec.authors       = ['Ilya N. Zykin']
  spec.email         = ['zykin-ilya@ya.ru']
  spec.description   = 'Convert strings and symbols to slug param'
  spec.summary       = 'Transliteration + Parameterization for slugs building'
  spec.homepage      = 'https://github.com/TheOpenCMS/to_slug_param'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|rspec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'rails'
  spec.add_runtime_dependency 'rails-i18n'
  spec.add_runtime_dependency 'stringex', '2.8.5'
end
