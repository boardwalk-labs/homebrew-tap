class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.16"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.16/boardwalk-darwin-arm64"
      sha256 "6c280672220702d52ba3cf5f9f9a561c22b614f0da15569ff49a7b5338cba5c1"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.16/boardwalk-darwin-x64"
      sha256 "5480fc25221ac76fe12d0845772c2913384616fb1eafd189835e84896e840055"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.16/boardwalk-linux-arm64"
      sha256 "1c1b3c6cd5f3513048c7bdf9661f99ce2ef24e75ff1c8d5a73eba08056700791"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.16/boardwalk-linux-x64"
      sha256 "0a04534d775e696cd7e8ae39974016cc6a4ea12f0b39d624df0c48554cfbc1a3"
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
