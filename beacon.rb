class Beacon < Formula
  version '0.1.0'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.0/beacon_v0.1.0_darwin_arm64.zip'
      sha256 '20507e243a96130ed850122db42bc1097d31864f39fbaabacb2419573aea483e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.0/beacon_v0.1.0_darwin_amd64.zip'
      sha256 '2c61fa0e1a2d517019f4dc8ad08b31a243892e1279df4e0c64fa139dd42864f6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.0/beacon_v0.1.0_linux_arm64.tar.gz'
      sha256 '7b8390b2579e59beaedb5558f94bb07daefa9016767c8bfc6fe18c333e00f2b7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.0/beacon_v0.1.0_linux_amd64.tar.gz'
      sha256 '856eb0546aac540838886da8e1f27d29e003969834fa5f854f35ab46d7896a35'
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
