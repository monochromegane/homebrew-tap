class Beacon < Formula
  version '0.0.2'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.2/beacon_v0.0.2_darwin_arm64.zip'
      sha256 '519781e3ec680fe4a5980810452773a70d06df48d3cb137cc8a07948eb482cf0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.2/beacon_v0.0.2_darwin_amd64.zip'
      sha256 'e6be2ab90ac2ae5360f561368d2c2f40cb8398a342d6d8006bd342e497462f2a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.2/beacon_v0.0.2_linux_arm64.tar.gz'
      sha256 '9a90d615758926e1a7f7762c8062b33924f401f24e17faa73f3f1aca14479597'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.2/beacon_v0.0.2_linux_amd64.tar.gz'
      sha256 '5d8920bb0b33683669210db80ed4a289b00a951cca56b8f5106a46383e12db1b'
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
