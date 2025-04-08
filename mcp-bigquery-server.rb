class McpBigqueryServer < Formula
  desc 'MCP BigQuery Server is a server that allows you to query BigQuery tables using MCP.'
  version '0.0.7'
  homepage 'https://github.com/monochromegane/mcp-bigquery-server'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.7/mcp-bigquery-server_v0.0.7_darwin_arm64.zip'
      sha256 '747ff28d7a69cdcce09701024c459093de33d5b72636eb5bbc50be15cebeade7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.7/mcp-bigquery-server_v0.0.7_darwin_amd64.zip'
      sha256 '9a110853f2ac838ec2ac1fd8527c51954ba7a35a29c0a4ef2892daa2ac8f528c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.7/mcp-bigquery-server_v0.0.7_linux_arm64.tar.gz'
      sha256 'a78fd99482e5c6155f76720bf3362327b9431ea4c8d157869d9f20fc802bb25e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/monochromegane/mcp-bigquery-server/releases/download/v0.0.7/mcp-bigquery-server_v0.0.7_linux_amd64.tar.gz'
      sha256 '6d3814f90197078258f61684c46fffa3245a09cb28aed0b71267593f0fa07d87'
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
