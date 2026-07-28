class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.17"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.17/boardwalk-darwin-arm64"
      sha256 "16bde8e242ffa4ead2036725e099443369c046ea0492d4d4d583ac7eeee8e49e"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.17/boardwalk-darwin-x64"
      sha256 "c24e31c7edcfc5b1ab02eda2fc912b96e203e8f48c53185219cbb31cb992ef16"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.17/boardwalk-linux-arm64"
      sha256 "bea025aaf9aaaa57bcf26144cf696ecd2b87b2d9bcc3c8cef69261d2e2425fcf"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.17/boardwalk-linux-x64"
      sha256 "c6c5452ad4d98e1d923debecbc317ea7acc8e57f24303945a80dc4cfc0c19ef8"
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
