class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.1"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.1/boardwalk-darwin-arm64"
      sha256 "31853f2a9cf2c96bd88dae5db7cec14d1b4bc13de016d64c50f50f3735bd5bfa"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.1/boardwalk-darwin-x64"
      sha256 "b5d60244e1553438d6ed014db02d05768842b9d0bbdceae3c4ccf4e13ca3c011"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.1/boardwalk-linux-arm64"
      sha256 "f80b1a5268e719c3519430ba0a0bebbe712f51ec2372b1f27d0dae387599c481"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.1/boardwalk-linux-x64"
      sha256 "7cfc5dc8c903f0b4fe4110b3891541f8fb82e4e50e59df497b2ed624ed62a2e4"
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
