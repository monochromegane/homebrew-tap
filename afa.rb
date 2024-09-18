class Afa < Formula
  desc 'AFA is a terminal-friendly AI command.'
  version '0.1.5'
  homepage 'https://github.com/monochromegane/afa'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.5/afa_v0.1.5_darwin_arm64.zip'
      sha256 '73d08d5ff660933fa66524984ef53446e5e940608e1cfb1ddd9185132051cf07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.5/afa_v0.1.5_darwin_amd64.zip'
      sha256 'ee576224b02358ed118038d3df314571387b69c4499d1e38b5069b68d1c3c1a6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.5/afa_v0.1.5_linux_arm64.tar.gz'
      sha256 'c4e339abf6f2dbc47a5556b0c7e8ddcf860d88e3a6614ca574ee689619f76ce3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.5/afa_v0.1.5_linux_amd64.tar.gz'
      sha256 '5878fcee6403e329b742e58ebad9c365f55f00fc10db998adeb0936b9b6d849b'
    end
  end

  head do
    url 'https://github.com/monochromegane/afa.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'afa'
  end
end
