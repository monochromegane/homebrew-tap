class Beacon < Formula
  version '0.0.1'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.1/beacon_v0.0.1_darwin_arm64.zip'
      sha256 '68caf989b911d9dad8091d6c1d1ccd7074d01f4ef4a27d3671e85a6320519ab7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.1/beacon_v0.0.1_darwin_amd64.zip'
      sha256 'c2d9358488d2eb6eaf34355c780f283fc1aae8033391f33e3cc489a6be962589'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.1/beacon_v0.0.1_linux_arm64.tar.gz'
      sha256 '797797950d5b4c700a80e1d0ecb357a6e78839c5de7e2984edf0e8ab5a542920'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.0.1/beacon_v0.0.1_linux_amd64.tar.gz'
      sha256 'ed352f1157fc294653a820759cb422bee9f8a831abf67bfd9e0eff2ca70dd62a'
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
