Pod::Spec.new do |spec|
  spec.name = 'Mastodon'
  spec.version = '0.5.1'
  spec.license = { :type => 'MIT' }
  spec.homepage = 'https://github.com/mitsuse/mastodon-swift'
  spec.authors = { 'Tomoya Kose' => 'tomoya@mitsuse.jp' }
  spec.summary = 'A client of Mastodon API for Swift.'
  spec.source = { :git => 'https://github.com/mitsuse/mastodon-swift.git' }
  spec.source_files = 'Sources/**/*.swift'
  spec.framework = 'SystemConfiguration'
  spec.dependency 'Result', '~> 3.2'
  spec.dependency 'Himotoki', '~> 3.0'
  spec.dependency 'APIKit', '~> 3.1'
end
