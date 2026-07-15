class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.3"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.3/boardwalk-darwin-arm64"
      sha256 "673ae378af7694d278209d571cdd636b7a79de86d4c383a8d328c5f55a02a5fc"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.3/boardwalk-darwin-x64"
      sha256 "304f2deb734451596f499f6fa89b9cf4aa4f74145e6d69d309ef174cccd9bf37"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.3/boardwalk-linux-arm64"
      sha256 "8f3ccf8bcb81ce04cec0ed0d96031f9287f77ca7fcf4b4bdaf41f602040895c8"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.3/boardwalk-linux-x64"
      sha256 "a8d97c79776417f8815811e6a4294adfcc273af075ff899b67451715c38036fb"
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
