class Afa < Formula
  desc 'AFA is a terminal-friendly AI command.'
  version '0.1.4'
  homepage 'https://github.com/monochromegane/afa'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.4/afa_v0.1.4_darwin_arm64.zip'
      sha256 'a35c688c89f2a17ddc25c25e6a0d756aa5c2b397864f36159228940935507252'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.4/afa_v0.1.4_darwin_amd64.zip'
      sha256 '6f605a6d52138dc19e1f16e578fc13559aba17b6107a49f566cb2c0b9ef62ee7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.4/afa_v0.1.4_linux_arm64.tar.gz'
      sha256 'f75313cd96d90d408149c6eed2799615f1974bdadbbdcf71166f23065d17f742'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa/releases/download/v0.1.4/afa_v0.1.4_linux_amd64.tar.gz'
      sha256 '7bd2882718f831c31772a7d3adb7920e92eb066747249f1224d37b3b15ae28e8'
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
