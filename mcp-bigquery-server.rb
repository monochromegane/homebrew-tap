class McpBigqueryServer < Formula
  desc 'MCP BigQuery Server is a server that allows you to query BigQuery tables using MCP.'
  version '0.0.6'
  homepage 'https://github.com/monochromegane/mcp-bigquery-server'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.6/mcp-bigquery-server_v0.0.6_darwin_arm64.zip'
      sha256 'c8e1ccf0ab6b7d23fb97b21655ad5c5b6fc5ac28d5ac8da4eb9db80b736d4398'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.6/mcp-bigquery-server_v0.0.6_darwin_amd64.zip'
      sha256 'ca3bf771b763d574bce49049c68d33ad9420de0a2d6942d12694bd5126099427'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.6/mcp-bigquery-server_v0.0.6_linux_arm64.tar.gz'
      sha256 '6cc616565f28ecd2e8391390394dddbbc475ad60187470ae1108b8dbfd83ba6e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.6/mcp-bigquery-server_v0.0.6_linux_amd64.tar.gz'
      sha256 '79f1aa49fc76c0ecd0bce1fd27349962acd11d355e84b9f4d3ee1bfba080b124'
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
