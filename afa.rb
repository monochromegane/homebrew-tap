class Afa < Formula
  desc 'AFA is a terminal-friendly AI command.'
  version '0.1.3'
  homepage 'https://github.com/monochromegane/afa'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.3/afa_v0.1.3_darwin_arm64.zip'
      sha256 '9c033b7716534ea4d945eaf90d5e54f394692dcaa4b8ed4cf57b4298b8c66d1b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.3/afa_v0.1.3_darwin_amd64.zip'
      sha256 '06187bc2edb83592441be7b36f590d2cdac985575858d49f12884c1c1fb5bdb2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.3/afa_v0.1.3_linux_arm64.tar.gz'
      sha256 '903f0884ca895779f7900c8e8629be874f186b4a1d80e7572bc7feddf1544686'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.3/afa_v0.1.3_linux_amd64.tar.gz'
      sha256 'f356ec4f0485b7917ac3d7e27de8bae00164c5efee444c9d4c1506d72bda369b'
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
