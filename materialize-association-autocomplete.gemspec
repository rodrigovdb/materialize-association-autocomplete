# frozen_string_literal: true

require_relative "lib/materialize/association/autocomplete/version"

Gem::Specification.new do |spec|
  spec.name          = "materialize-association-autocomplete"
  spec.version       = Materialize::Association::Autocomplete::VERSION
  spec.authors       = ["Rodrigo Otavio van den Berg Maia"]
  spec.email         = ["rodrigovdb@gmail.com"]

  spec.summary       = "autocomplete for associations using rails-materialize"
  spec.description   = "Provides associations autocomplete using rails-materialize"
  spec.homepage      = ""
  spec.license       = "GPLv3"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "materialize-sass"

  spec.add_development_dependency "bundler",    "~> 1.3"
  spec.add_development_dependency "rspec",      "~> 3.4"
  spec.add_development_dependency "rubocop",    "~> 1.10"
  spec.add_development_dependency "simplecov",  "~> 0.12"
end
