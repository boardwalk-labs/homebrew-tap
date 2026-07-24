class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.0"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.0/boardwalk-darwin-arm64"
      sha256 "697df4a75f2ee0f5a426c77abc2ee600379097d500bccaf8d2366e96091a0d05"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.0/boardwalk-darwin-x64"
      sha256 "138849a01e88c40b001f1013d102959ac6614d568cb8a236d67a72e0485c02bb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.0/boardwalk-linux-arm64"
      sha256 "0687903c79883b2df7b92d82bf1d338a108bc4c1b4215bdb33aa726386a8e5ef"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.0/boardwalk-linux-x64"
      sha256 "99adda53d52d20d660c47e9d0aa359b80c7b07f04caf594e10ee912f9f16c330"
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
