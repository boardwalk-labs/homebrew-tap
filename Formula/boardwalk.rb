class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.21"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.21/boardwalk-darwin-arm64"
      sha256 "06af40c2fb18b905835816d023961729123de2dd0654ae513500b86f0b46c9d4"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.21/boardwalk-darwin-x64"
      sha256 "29838937624e25da3ddb161e7349f51468f7a75e634219db5bb0d69004712976"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.21/boardwalk-linux-arm64"
      sha256 "048ed153444feb8baddf4468893913db3b79c60d541320632c7a61dc864ab3e0"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.21/boardwalk-linux-x64"
      sha256 "876a047432942d86a863dfed4dbea1a8d2ca56b05e2aefd4a7331207e637fc7f"
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
