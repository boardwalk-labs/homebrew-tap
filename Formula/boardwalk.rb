class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.5"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.5/boardwalk-darwin-arm64"
      sha256 "cedcf85fb3f0e29d3c21114d90c52885002092013f2259fe18ccc7da71236f02"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.5/boardwalk-darwin-x64"
      sha256 "009d9f43bb11ced3632c7aa6277cb616a4b421e22e001145218a4077849222a1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.5/boardwalk-linux-arm64"
      sha256 "20594399836ca484801ff41c23666d31c83a8633d61e88952c04dc8e42cdc3f3"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.5/boardwalk-linux-x64"
      sha256 "3ff5ce454eb6750431f319810d974c0d6625cd4cc9563b96bcb0128687ee919a"
    end
  end

  def install
    # Homebrew stages the downloaded binary under its release-asset name; install it as `boardwalk`.
    bin.install Dir["boardwalk-*"].first => "boardwalk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/boardwalk --version")
  end
end
