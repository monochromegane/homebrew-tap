class Stamp < Formula
  version '0.0.1'
  homepage 'https://github.com/monochromegane/stamp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.1/stamp_v0.0.1_darwin_arm64.zip'
      sha256 '90510da7a58e5f028491430445a97a42367e49b3655a07f21b8ad9e0b4ac537b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.1/stamp_v0.0.1_darwin_amd64.zip'
      sha256 '4d569d7b55d36afe89fd5bb9791eb55f5f724254fceff32c1d549310451ecc11'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.1/stamp_v0.0.1_linux_arm64.tar.gz'
      sha256 '04bd1040bc5b35bc77e7070471614e36098a121c1c1318b5e58c53ae30797672'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.1/stamp_v0.0.1_linux_amd64.tar.gz'
      sha256 '197c8c7c18887a9836da6d765fc21a697558df32370e8c0c3852d04ed0f77b90'
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
