# frozen_string_literal: true

require_relative "lib/orchestrate_flow/version"

Gem::Specification.new do |spec|
  spec.name = "orchestrate_flow"
  spec.version = OrchestrateFlow::VERSION
  spec.authors = ["Daniel Morales"]
  spec.email = ["danielmorales1202@gmail.com"]

  spec.summary = "Native orchestration in Ruby with advanced workflow capabilities"
  spec.description = "Ruby gem for managing complex workflows and orchestrating tasks."
  spec.homepage = "https://compensix.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/danielmoralesp/orchestrate_flow"
  spec.metadata["changelog_uri"] = "https://github.com/danielmoralesp/orchestrate_flow/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob("**/*").reject do |file|
    file.match(%r{\A(?:test|spec|features)/}) ||
      file.match(/\A\.(git|travis|circleci|appveyor)/) ||
      file.match(/\.gem$/) # Exclude .gem files from the gem package
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
