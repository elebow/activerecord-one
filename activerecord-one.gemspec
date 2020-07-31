lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "activerecord-one"
  spec.version       = "1.0.1"
  spec.authors       = ["Eddie Lebow"]
  spec.email         = ["elebow@users.noreply.github.com"]

  spec.summary       = "Provides ActiveRecord::Relation#one! to assert one record and return it."
  spec.description   = "Provides `ActiveRecord::Relation#one!`, a convenience method that asserts a relation contains exactly one record and returns it. If there are no records or more than one, an `ActiveRecord::NoRecordFound` or `ActiveRecord::MultipleRecordsFound` exception is raised, respectively."
  spec.homepage      = "https://github.com/elebow/activerecord-one"

  spec.license       = "public domain"

  spec.files = Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "sqlite3"
end
