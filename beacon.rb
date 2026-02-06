class Beacon < Formula
  desc 'beacon is a CLI tool that tracks Claude Code session states within tmux.'
  version '0.2.0'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.0/beacon_v0.2.0_darwin_arm64.zip'
      sha256 '7ae7ff018620a1120b2bcc42ff164e405ee57844fac60ac0bead7c07d0040492'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.0/beacon_v0.2.0_darwin_amd64.zip'
      sha256 '885439e996ed62bf333e804ef9bf01231ae15f5e226dd2c44176accbe1cec9d2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.0/beacon_v0.2.0_linux_arm64.tar.gz'
      sha256 'a44e0188c9cb35b1e5ea1d4a7d19443152655155fbaa8f8e3888d39dc856cad3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.2.0/beacon_v0.2.0_linux_amd64.tar.gz'
      sha256 '49886d6233ffc27c09b44c9a2f1c4f1a3ba0d740dcc3b43ca39aa0642a10b1cb'
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
