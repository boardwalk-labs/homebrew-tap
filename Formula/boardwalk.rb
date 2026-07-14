class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.1.33"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.33/boardwalk-darwin-arm64"
      sha256 "0e3b9f34f134122527b58ab5873e04ad8c4ef71274897cfc8d096e7b20478d2a"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.33/boardwalk-darwin-x64"
      sha256 "c23ae1c8d1e71a7b527c1d4de3c21e7813b1691861e8d3d702418c2cc132d83c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.33/boardwalk-linux-arm64"
      sha256 "b1b2b4208e0ac885bc90c46f1de60742f5f3d6107a514081c154bd2c883eb5af"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.33/boardwalk-linux-x64"
      sha256 "ceb038468914a87a4bdcff33588085d18a7ca098c55d8fc41c154c7ed0c895a0"
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
