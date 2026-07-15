class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.2"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.2/boardwalk-darwin-arm64"
      sha256 "a58dfb4c11f2b90ea4ca2e8c6f3e8dccf494637c6ec09cdf2315e2335dc16fa2"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.2/boardwalk-darwin-x64"
      sha256 "db2ed4a54a2814e93c3bbe3e805234cd1db35745e47767ca861e837cf7fbe29d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.2/boardwalk-linux-arm64"
      sha256 "4041c794bbc6ab56ba8919c59928a76596fbabc5cadbb9f08d47ed12c7919529"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.2/boardwalk-linux-x64"
      sha256 "50731fc896181627ba5ef05021d76585e72054c06c3c349e95252f4900d7a0b2"
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
