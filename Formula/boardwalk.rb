class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.1.32"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.32/boardwalk-darwin-arm64"
      sha256 "3471bfeef33563b67626d4abaf997f3767ca7d4059bf9eedea7c2e08e29ed94f"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.32/boardwalk-darwin-x64"
      sha256 "76da5926c32c2d71dd6dd465df85cc1747beb5c128ab754ded6c63d43c349163"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.32/boardwalk-linux-arm64"
      sha256 "f31ca2a1f49af5bf6787a4417f3c5f96495a401066cf21b0b7e285c9401dcb7b"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.32/boardwalk-linux-x64"
      sha256 "f3a4388dc6bea8c0eb3216acf8693ae9510221dd88d90c3b077270eaaaa29683"
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
