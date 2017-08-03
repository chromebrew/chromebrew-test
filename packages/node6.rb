require 'package'

class Node6 < Package
  description 'As an asynchronous event driven JavaScript runtime, Node is designed to build scalable network applications.'
  homepage 'https://nodejs.org/en/'
  version '6.11.2'
  source_url 'https://nodejs.org/dist/v6.11.2/node-v6.11.2.tar.xz'
  source_sha256 '04af4992238b19124ea56f1bcfda36827613a24eb3b00fc3b50f261a415a26e4'

  depends_on 'buildessential'
  depends_on 'python27'

  def self.build
    case ARCH
    when "x86_64"
      system "CC='gcc -m64' python2.7 ./configure --without-snapshot"
    else
      system "CC='gcc' python2.7 ./configure --without-snapshot"
    end
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"

    # Fix Permissiongs for -g installs of node packages
    system "sudo chown -R chronos /usr/local/bin"
    system "sudo chown -R chronos /usr/local/share"
    if Dir.exists?('/usr/local/lib/node_modules')
      system "sudo chown -R chronos /usr/local/lib/node_modules"
    end
  end
end
