class Stamp < Formula
  version '0.0.2'
  homepage 'https://github.com/monochromegane/stamp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.2/stamp_v0.0.2_darwin_arm64.zip'
      sha256 '87cc2bf88dec86e018f81706806180825b89f6a84ae49027bba3efac8466c6db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.2/stamp_v0.0.2_darwin_amd64.zip'
      sha256 '57bd459d1e513353a48faea59067b9c16148dd95f2f2a2f427bbbb9185d96b11'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.2/stamp_v0.0.2_linux_arm64.tar.gz'
      sha256 '83f7efd9de7b81b16860eefb9f04790ac42e3e6db556623a66be4d398fe59495'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.2/stamp_v0.0.2_linux_amd64.tar.gz'
      sha256 '5109f7ff34202c121bce1799036ffa846dade1309432d220c98c7cae35e70647'
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
