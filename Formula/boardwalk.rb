class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.7"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.7/boardwalk-darwin-arm64"
      sha256 "4b81b3c6d4f24447b18821eb508218e9c3b1b149a0f064bcb9d6837535750fe6"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.7/boardwalk-darwin-x64"
      sha256 "da052950a781e0cb4a81551093e89f1dba935c59887bdf18af3ad5ece307e0d8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.7/boardwalk-linux-arm64"
      sha256 "41043a64bcd903044cdef04ab79d795319497488529fd883e312e3e8fee15079"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.7/boardwalk-linux-x64"
      sha256 "7a39d701a14f6635dd6da2159e229c93b617ffd7f71f864b905309cd68e63f93"
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
