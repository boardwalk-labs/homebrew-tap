class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.23"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.23/boardwalk-darwin-arm64"
      sha256 "4d6a3de7e564ce9c33558fd3624d94683d4dc7b536097e78e86fb3865f7fdcd1"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.23/boardwalk-darwin-x64"
      sha256 "8a67d3b2b024a737eb328dd1f5cb215ab996c615488e6909015a307d4da34bf0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.23/boardwalk-linux-arm64"
      sha256 "2995c310ab752669247a775680097778fce964c0b9e05af782e8e383b0588ea7"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.23/boardwalk-linux-x64"
      sha256 "160427690af599b963c9dc8dfbc6a6975a43bba417775577448f9458deb37ec4"
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
