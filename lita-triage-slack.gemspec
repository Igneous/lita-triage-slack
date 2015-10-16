Gem::Specification.new do |spec|
  spec.name          = "lita-triage-slack"
  spec.version       = "0.0.1"
  spec.authors       = ["Igneous"]
  spec.email         = ["bucky.wolfe@qualifacts.com"]
  spec.description   = %q{A handler to spin up a triage channel on-demand}
  spec.summary       = %q{A handler to spin up a triage channel on-demand}
  spec.homepage      = "http://github.com/igneous/lita-triage-slack"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.1"
  spec.add_runtime_dependency "slack-ruby", ">= 1.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
