
lib = File.expand_path "lib", __dir__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
version = "0.0.1".freeze

::Gem::Specification.new do |spec|
  spec.name = "google_events"
  spec.version = version
  spec.authors = ["Grant Timmerman"]
  spec.email = ["timmerman+devrel@google.com"]

  spec.summary = "Google CloudEvents"
  spec.description =
    "CloudEvent types provided by Google"
  spec.license = "Apache-2.0"
  spec.homepage = "https://github.com/googleapis/google-cloudevents-ruby"

  spec.files = ::Dir.glob("lib/**/*.rb") +
               ::Dir.glob("*.md") +
               ::Dir.glob("docs/*.md") +
               ["LICENSE", ".yardopts"]
  spec.require_paths = ["lib"]
  
  spec.required_ruby_version = ">= 2.5.0"
  spec.add_dependency "json", "~> 2.3.1"
  spec.add_dependency "dry-types", "~> 1.4.0"
  spec.add_dependency "dry-struct", "~> 1.3.0"

  if spec.respond_to? :metadata
    spec.metadata["changelog_uri"] =
      "https://googleapis.github.io/google-cloudevents-ruby/v#{version}/file.CHANGELOG.html"
    spec.metadata["source_code_uri"] = "https://github.com/googleapis/google-cloudevents-ruby"
    spec.metadata["bug_tracker_uri"] = "https://github.com/googleapis/google-cloudevents-ruby/issues"
    spec.metadata["documentation_uri"] = "https://googleapis.github.io/google-cloudevents-ruby/v#{version}"
  end
end