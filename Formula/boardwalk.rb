class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.4"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.4/boardwalk-darwin-arm64"
      sha256 "6b7c4285592b269bd98f1bf238d6672a4bf3d2c61f6b5528f68a852d5ce5d5a7"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.4/boardwalk-darwin-x64"
      sha256 "19f570349147cedb82006613fe5cbf71476525dd0fccdb042f79a97a6a7cfa5e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.4/boardwalk-linux-arm64"
      sha256 "bc4f89afc75fb5744c35cc74d518d1cbf923a7ae28aa310c83322adb07ec02c9"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.4/boardwalk-linux-x64"
      sha256 "803f1f549b4bcb07122968b1421fc4ca39834cab95b53722548b560a864f34b5"
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
