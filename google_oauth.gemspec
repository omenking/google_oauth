# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{google_oauth}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew WC Brown"]
  s.date = %q{2010-08-11}
  s.description = %q{google_oauth is a Ruby client for the Google API using OAuth.}
  s.email = %q{omen.king@gmail.com}
  s.files = ["LICENSE", "README.textile","lib/google_oauth.rb"] + Dir.glob('lib/google_oauth/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/omenking/google_oauth}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{google_oauth is a Ruby client for the Google API using OAuth.}
  s.add_dependency(%q<oauth>, [">= 0.4.0"])
  s.add_dependency(%q<json>, [">= 1.1.9"])
  s.add_dependency(%q<mime-types>, [">= 1.16"])
end
