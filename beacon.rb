class Beacon < Formula
  version '0.0.3'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.3/beacon_v0.0.3_darwin_arm64.zip'
      sha256 '3ac14d66d51651f69ded548ebb79275031b1ea0b1051c99dc9717df06185cb78'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.3/beacon_v0.0.3_darwin_amd64.zip'
      sha256 'eb712c3c4e0f1649fbe655f1f916a480a1ed46a540ab022bc2d5a017c84fe75a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.3/beacon_v0.0.3_linux_arm64.tar.gz'
      sha256 'fe6c18e32e6391ea1c97e1604533f2928a69d60e3b58ea18bdca4b5568aee6dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.3/beacon_v0.0.3_linux_amd64.tar.gz'
      sha256 'badeacc08d2bc0f15d9a613f58439ac8bf9087320bcfa29aa7b9fa03f84358a6'
    end
  end

  head do
    url 'https://github.com/monochromegane/beacon.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'beacon'
  end
end
