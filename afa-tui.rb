class AfaTui < Formula
  desc ' AFA-TUI is a rich Text User Interface for AFA.'
  version '0.1.4'
  homepage 'https://github.com/monochromegane/afa-tui'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.4/afa-tui_v0.1.4_darwin_arm64.zip'
      sha256 '5f6138ba57565a4eb6138437ba9fa966262d72c62633dd7ab961380d84665bbb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.4/afa-tui_v0.1.4_darwin_amd64.zip'
      sha256 'db7dcd20000a99dc2a87d3c763e9d6170ced0a236418c3bd8fe2a18626e2f17a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.4/afa-tui_v0.1.4_linux_arm64.tar.gz'
      sha256 'ff89ca8029f9811385e90bcb3640f46b1d57aec4e7cc715a0ca2eafe0f16bb43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/afa-tui/releases/download/v0.1.4/afa-tui_v0.1.4_linux_amd64.tar.gz'
      sha256 '55410b4758a663296b5314cd82e083950ccf5a577631f1de015099a004aeac12'
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
