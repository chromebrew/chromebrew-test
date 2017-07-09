require 'package'

class Trousers < Package
  description 'The open-source TCG Software Stack.'
  homepage 'http://trousers.sourceforge.net/'
  version '0.3.14-1'
  source_url 'https://downloads.sourceforge.net/project/trousers/trousers/0.3.14/trousers-0.3.14.tar.gz'
  source_sha256 'ce50713a261d14b735ec9ccd97609f0ad5ce69540af560e8c3ce9eb5f2d28f47'

  binary_url ({
    aarch64: 'https://github.com/jam7/chromebrew/releases/download/bin-armv7l/trousers-0.3.14-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://github.com/jam7/chromebrew/releases/download/bin-armv7l/trousers-0.3.14-1-chromeos-armv7l.tar.xz',
       i686: 'https://github.com/jam7/chromebrew/releases/download/bin-i686/trousers-0.3.14-1-chromeos-i686.tar.xz',
     x86_64: 'https://github.com/jam7/chromebrew/releases/download/bin-x86_64/trousers-0.3.14-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '4118ffa8a3a479f2b3f64bf500a5bc7e243b7833ac7e31cb982682b3ac3da323',
     armv7l: '4118ffa8a3a479f2b3f64bf500a5bc7e243b7833ac7e31cb982682b3ac3da323',
       i686: '5c3121a5b5e52b16d63d00da0ceb281734f2cd262d5f686692260a9841abd62b',
     x86_64: '9ffc0da97adbc542a44285882a8ace99e21986e11a7676da3314c9ab59a94700',
  })

  depends_on 'openssl'
  depends_on 'libtool'
  depends_on 'pkgconfig'

  def self.build
    system './configure --prefix=/usr/local --with-gui=none'
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
