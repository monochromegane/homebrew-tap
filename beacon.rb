class Beacon < Formula
  version '0.1.2'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.2/beacon_v0.1.2_darwin_arm64.zip'
      sha256 '9938078eae09f89127d76fbe76bbc6a943bdc77fe6a630b1231a95d1cdf266b2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.2/beacon_v0.1.2_darwin_amd64.zip'
      sha256 'f28af01d9a9c12ce1d12a50faac7904836db3fdf4e609224c94b9997c5b42cb3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.2/beacon_v0.1.2_linux_arm64.tar.gz'
      sha256 '383014c86ffc47b11203d95435e9bf8f13e1a71e5778db05fa3c45916a70082d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.2/beacon_v0.1.2_linux_amd64.tar.gz'
      sha256 'f66541c0b328e794f3e7b6e6fe79a7032e12bd3527c13a3486605175ed6c2848'
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
