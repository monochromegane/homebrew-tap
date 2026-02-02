class Beacon < Formula
  version '0.1.1'
  homepage 'https://github.com/monochromegane/beacon'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.1/beacon_v0.1.1_darwin_arm64.zip'
      sha256 'ffd31fb76c536b7cba6244e752db3ad93f5ab8d3c13f18fd41b2989046b5bacc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.1/beacon_v0.1.1_darwin_amd64.zip'
      sha256 '7c439485865e82ab933391f9b68cb2ec9c19f21f548feff1882be71982fa0cac'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.1/beacon_v0.1.1_linux_arm64.tar.gz'
      sha256 '4e2f4814627f242e992e371074922c3a83c7fed0c74df2255e2dc9dc3bf2741c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/beacon/releases/download/v0.1.1/beacon_v0.1.1_linux_amd64.tar.gz'
      sha256 'bf73876675b5e01580254c501cbb7b6b99e5f4e2c93026faa2c5d17c8497f1f6'
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
