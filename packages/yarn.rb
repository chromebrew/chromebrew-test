require 'package'

class Yarn < Package
  description 'Yarn is a new package manager for JavaScript and an alternative to npm.'
  homepage 'https://yarnpkg.com/en/'
  version '1.19.1'
  source_url 'https://github.com/yarnpkg/yarn/releases/download/v1.19.1/yarn-v1.19.1.tar.gz'
  source_sha256 '34293da6266f2aae9690d59c2d764056053ff7eebc56b80b8df05010c3da9343'

  binary_url ({
  })
  binary_sha256 ({
  })

  node_version=`node -v 2> /dev/null`.chomp
  depends_on 'nodebrew' unless "#{node_version}" != ""

  def self.install
    system "mkdir -p #{CREW_DEST_PREFIX}"
    system "cp -r lib/ #{CREW_DEST_PREFIX}"
    system "cp -r bin/ #{CREW_DEST_PREFIX}"
  end
end
