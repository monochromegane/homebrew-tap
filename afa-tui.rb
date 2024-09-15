class AfaTui < Formula
  desc ' AFA-TUI is a rich Text User Interface for AFA.'
  version '0.1.2'
  homepage 'https://github.com/monochromegane/afa-tui'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.2/afa-tui_v0.1.2_darwin_arm64.zip'
      sha256 '45dd65ef238851a8b4431982fb71bf7bdebbdad6c1f76e30d4a09321b93de506'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.2/afa-tui_v0.1.2_darwin_amd64.zip'
      sha256 'b9a571939b04b3af59ba3c3f9b4fce445036eb9a73b0739e836ed74b83e8e7db'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.2/afa-tui_v0.1.2_linux_arm64.tar.gz'
      sha256 '71d37cbcf23fe44d1a6f582dc226b63a1a00ac8e5c7e0447c325a1fd913b5115'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.2/afa-tui_v0.1.2_linux_amd64.tar.gz'
      sha256 '9c0bf208dd0d63353add1d2f4158de0049c0450cfb72839e80e510eaf5d2216b'
    end
  end

  head do
    url 'https://github.com/monochromegane/afa-tui.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'afa-tui'
  end
end
