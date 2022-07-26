# frozen_string_literal: true

require_relative "lib/my_solaredge/version"

Gem::Specification.new do |spec|
  spec.name          = "my_solaredge"
  spec.version       = MySolaredge::VERSION
  spec.authors       = ["reedstonefood"]
  spec.email         = ["reedstonefood@users.noreply.github.com"]

  spec.summary       = "Wrapper for Solaredge's monitoring webservice API"
  spec.description   = "A tool to get data from Solaredge's monitoring website, commonly data from solar panels"
  spec.homepage      = "https://github.com/reedstonefood/my_solaredge"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/reedstonefood/my_solaredge"
  spec.metadata["changelog_uri"] = "https://github.com/reedstonefood/my_solaredge/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.17.3"

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
  }
end
