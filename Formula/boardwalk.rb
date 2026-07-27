class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.9"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.9/boardwalk-darwin-arm64"
      sha256 "9ff2cb5d7d945880495506cfa762f4b158fe3acf56d5d9f5cd187bf70286dc89"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.9/boardwalk-darwin-x64"
      sha256 "8821c01cb60b89494597e955f564738f7df868daf35aaa27ef6d04f7f197549b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.9/boardwalk-linux-arm64"
      sha256 "ff8e4f310d3fc700fe5b1b2170bdd5933a07e0b88c4c3f54687496150c8c42ed"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.9/boardwalk-linux-x64"
      sha256 "65c88f00510d1bcd45993d163ec0de4ed3183cb2e1f52c7c7fd0d5a5994eb4b6"
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
