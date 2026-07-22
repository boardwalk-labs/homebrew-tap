class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.10"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.10/boardwalk-darwin-arm64"
      sha256 "111b5a5b6987aa5efdacf0a45c72994fbd7a765ad69986ec69505e5da47d9d70"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.10/boardwalk-darwin-x64"
      sha256 "63810fc55247ce27d752d6b6b1be3002994a31ce518f0a8820228d2be0e16000"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.10/boardwalk-linux-arm64"
      sha256 "6ef5ee86f5f64e4a2f4fde2492edc84c0fd83c5f212a27352f370b74714fc427"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.10/boardwalk-linux-x64"
      sha256 "17de076f9bf98911db705fafaf3dce0ed1b66ed566b2d8346e3f5cb8054e099a"
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
