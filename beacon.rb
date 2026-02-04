class Beacon < Formula
  version '0.1.3'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.3/beacon_v0.1.3_darwin_arm64.zip'
      sha256 'b38c31035b7a2cc83a24535de8f037ac0fd9fa85d8fa2f20ea98f83ea735013d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.3/beacon_v0.1.3_darwin_amd64.zip'
      sha256 '3d148d39fbf2372f69396805533ecb3124c6f39108f4466478040ed591b1fd7a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.3/beacon_v0.1.3_linux_arm64.tar.gz'
      sha256 '2109e61be38c118103ae8226800d030302bd24c92179b1b145671eb969c43ea7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.3/beacon_v0.1.3_linux_amd64.tar.gz'
      sha256 '350b94c3d44f1918a21e18cd43062af358dd9ed04ca3d0aea9f1e026eb57a54c'
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
