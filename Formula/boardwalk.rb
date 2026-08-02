class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.19"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.19/boardwalk-darwin-arm64"
      sha256 "e7e73d2380d596336d37b9e52487492fdb854ca8f134c6cc97faf3789a37bf94"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.19/boardwalk-darwin-x64"
      sha256 "de4b27418be0fdcb706d82b9efa2f23f09992d7895eef5d1483cbb307811faa6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.19/boardwalk-linux-arm64"
      sha256 "895e024a3005ce575c0ce2e6019c400fb49002ca82ca8548cd7d1b66195dd353"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.19/boardwalk-linux-x64"
      sha256 "3243e7cad789c61aa455b482c371c19a2139b9f21bb7b187184a97f0172cad27"
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
