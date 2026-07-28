class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.18"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.18/boardwalk-darwin-arm64"
      sha256 "d7e0d131fdc5d978eae6f697e4aab495ebc50906db21abdecffb0ccb0afdb2f5"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.18/boardwalk-darwin-x64"
      sha256 "b9f954ae8816c333b032b30ca1ac3dc7ab854e0be82f3599aea7da995b810439"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.18/boardwalk-linux-arm64"
      sha256 "a628c93d2b209b69f61b3019369ffd761c5f1bb6247672cfc908133c4c74c945"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.18/boardwalk-linux-x64"
      sha256 "73e93e3ab9ad18a4a72b862ce61502af9db5b36eff2b61d584d63bb5ebea892d"
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
