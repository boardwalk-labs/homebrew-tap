class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.8"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.8/boardwalk-darwin-arm64"
      sha256 "1f9d71be2c2e6400c9fc6624ba4dc50dbc7efbcc19c63dd94f11170cffdd23f3"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.8/boardwalk-darwin-x64"
      sha256 "00d56b885498336404e978b367a33c709deb6ebe3e4a5954cb478211abfb49c3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.8/boardwalk-linux-arm64"
      sha256 "c193725af65ba5d9c1c37bc811a7b33108596945707d65b7c3809c84ad57fdfd"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.8/boardwalk-linux-x64"
      sha256 "b1e82e9990de66252cf35aeda76ea9443ac89a86e50f99b279d7affc38ab9794"
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
