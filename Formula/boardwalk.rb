class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.10"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.10/boardwalk-darwin-arm64"
      sha256 "907e629fe2c91ca2cf0446e6e79a1b65ec1bfd2ec8ea264aeaadbf872bf88548"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.10/boardwalk-darwin-x64"
      sha256 "7152ebd7dd91b91cb1a70c29764813e8785c28f4c5a05767f846def6fd43a549"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.10/boardwalk-linux-arm64"
      sha256 "9cf9a8b6ab30a62ea8b54f14127ebd2a8160c62bba297be167f15e9383e58316"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.10/boardwalk-linux-x64"
      sha256 "68a863af7e726ade2f58e69137e0e360eb310ffebd9c09b31c5cf9283e05fc2d"
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
