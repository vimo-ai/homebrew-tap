# Homebrew Formula for Memex (Full Version)
#
# Usage: brew install vimo-ai/tap/memex

class Memex < Formula
  desc "CLI for searching AI CLI session history with full features"
  homepage "https://github.com/vimo-ai/memex"
  version "0.0.4-platform.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vimo-ai/memex/releases/download/v#{version}/memex-darwin-arm64"
      sha256 "24421524d8e4a1557b03bb4b7635c88dd9326134b48a03b1f3c95c8e47592a25"
    else
      url "https://github.com/vimo-ai/memex/releases/download/v#{version}/memex-darwin-x64"
      sha256 "78b04dc7596a79b716398ef937ebc43e657f69714d09a170a5d88f78d6d07e3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vimo-ai/memex/releases/download/v#{version}/memex-linux-arm64"
      sha256 "c6fe73828e1b18d32879eddb9bcd902866d599e925c9ac7bc5f03c5749076d02"
    else
      url "https://github.com/vimo-ai/memex/releases/download/v#{version}/memex-linux-x64"
      sha256 "c063884a849c550757fe7dbc5ac69bd1d680af4832f667ee2acca1aa33f74ac1"
    end
  end

  def install
    binary = Dir["memex-*"].first || "memex"
    bin.install binary => "memex"
  end

  test do
    assert_match "memex", shell_output("#{bin}/memex --version")
  end
end
