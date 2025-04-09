class McpBigqueryServer < Formula
  desc 'MCP BigQuery Server is a server that allows you to query BigQuery tables using MCP.'
  version '0.0.8'
  homepage 'https://github.com/monochromegane/mcp-bigquery-server'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.8/mcp-bigquery-server_v0.0.8_darwin_arm64.zip'
      sha256 '3ce5f7bdb01810683d076b236f585129e69be914b472fc0029313f9be0f6292d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.8/mcp-bigquery-server_v0.0.8_darwin_amd64.zip'
      sha256 '1929e98fb5d229a9c314f8aac8cd1e0b616f91127b43170d0e0c9451aa7325de'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.8/mcp-bigquery-server_v0.0.8_linux_arm64.tar.gz'
      sha256 'cda52f14dcab1100aa99855caf65b80532176d09996654aad1b492ceb0318db8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.8/mcp-bigquery-server_v0.0.8_linux_amd64.tar.gz'
      sha256 '03025a76e74fbddc2dfa24fd71f3f08fdabbed94bc97377222544e9e4f05eecc'
    end
  end

  head do
    url 'https://github.com/monochromegane/mcp-bigquery-server.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mcp-bigquery-server'
  end
end
