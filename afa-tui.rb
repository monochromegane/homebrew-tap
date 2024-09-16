class AfaTui < Formula
  desc ' AFA-TUI is a rich Text User Interface for AFA.'
  version '0.1.3'
  homepage 'https://github.com/monochromegane/afa-tui'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.3/afa-tui_v0.1.3_darwin_arm64.zip'
      sha256 '11d202d26efd8921ad1eece1eb088901cd97f77702470e7003878890d3117337'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.3/afa-tui_v0.1.3_darwin_amd64.zip'
      sha256 '045c944288ad80c14dc0dd9d703fa439da5ad0a96b31e4e2aded311487d56336'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.3/afa-tui_v0.1.3_linux_arm64.tar.gz'
      sha256 'e5cf6acc31edf12ce7987f25a66c6c0430f84e2b8c1b346f78b50dd1b9948cc4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.3/afa-tui_v0.1.3_linux_amd64.tar.gz'
      sha256 'ccc6a22343e98735a0a9a27ac12575b2bc4e649f31bcde42baca865cf7e21467'
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
