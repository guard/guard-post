# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-post"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lance Pollard"]
  s.date = "2011-09-19"
  s.description = "Watch documents update, save them to MongoDB, MySQL, etc."
  s.email = "lancejpollard@gmail.com"
  s.files = ["Rakefile", "lib/guard/post/templates/Guardfile", "lib/guard/post/version.rb", "lib/guard/post.rb"]
  s.homepage = "http://github.com/viatropos/guard-post"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-post"
  s.rubygems_version = "1.8.10"
  s.summary = "Watch documents update, save them to MongoDB, MySQL, etc."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
