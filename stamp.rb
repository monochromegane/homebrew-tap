class Stamp < Formula
  version '0.0.3'
  homepage 'https://github.com/monochromegane/stamp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.3/stamp_v0.0.3_darwin_arm64.zip'
      sha256 '7e3d9d7e5f3f4d8955fa638bbce73d7755afb5722a913d2bb0df40c715131c4c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.3/stamp_v0.0.3_darwin_amd64.zip'
      sha256 'c50fe0b7f692b607d57537d533188a95ee250fb082b95b34141ebd30c67a5e6f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.3/stamp_v0.0.3_linux_arm64.tar.gz'
      sha256 '770cecdbbb676d3c5cab352eacef6724651e354cd4f4fd1346987343394a6781'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.3/stamp_v0.0.3_linux_amd64.tar.gz'
      sha256 '227a9eac0024a873474ba54d68020b9c13e8f63e21a98cc08fd7c185fbc0e08f'
    end
  end

  head do
    url 'https://github.com/monochromegane/stamp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'stamp'
  end
end
