class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.8"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.8/boardwalk-darwin-arm64"
      sha256 "c92d508c453117bcb6bffd6cb8c0cc3c953ba4d116dedd16f6f4fd8e4278c452"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.8/boardwalk-darwin-x64"
      sha256 "59ed508d24f6a311ffe57286a7efd17a8d9d471d0b8eef828dbd6dcd51e07fe8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.8/boardwalk-linux-arm64"
      sha256 "71a858f99776133bc0ce7bf9bee333ede3df520ffbcd07e3859fcd9f67b9bdb6"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.8/boardwalk-linux-x64"
      sha256 "5882df781f74c421348717877b539f70f7d07f231f26a73b6c5d25e20af11d13"
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
