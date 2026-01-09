class Stamp < Formula
  version '0.0.4'
  homepage 'https://github.com/monochromegane/stamp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.4/stamp_v0.0.4_darwin_arm64.zip'
      sha256 '3b8bd9ff003ca9cddeb84187da8e82a9502d1cfd6977ec4abfea5d4499396ad3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.4/stamp_v0.0.4_darwin_amd64.zip'
      sha256 '732648071edf59b261bbf8eee2a6972193649d2e60432ca3c6dba85f02b766e6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.4/stamp_v0.0.4_linux_arm64.tar.gz'
      sha256 '19ace10fa4a80ef1952bb8c530a801b6f9e9ddd67b9ee78e9155a625abc46c31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/stamp/releases/download/v0.0.4/stamp_v0.0.4_linux_amd64.tar.gz'
      sha256 'f46fe11c642d85915d4be684c5efbe7d69154cbba805998681e8f435442abb3f'
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
