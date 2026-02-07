class Beacon < Formula
  desc 'beacon is a CLI tool that tracks Claude Code session states within tmux.'
  version '0.2.1'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.1/beacon_v0.2.1_darwin_arm64.zip'
      sha256 '0199f50fbda5bb910356a5e0f0037d0fc09f2b84923b2fb17ac70efa491539cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.1/beacon_v0.2.1_darwin_amd64.zip'
      sha256 '325c8e37ce3dbf7b19c3b6f9086dbb3acfed1a3c51fa3d2d87b429bc4a49b109'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.1/beacon_v0.2.1_linux_arm64.tar.gz'
      sha256 '742bddfcaf42f64733f0a5a75ff9b9bf5fc132e4405010337a72a691ee4c979b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.1/beacon_v0.2.1_linux_amd64.tar.gz'
      sha256 'f3954dce675ca6228547a224233dd7b465af71a55ad47ad35370d9e8188020f9'
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
