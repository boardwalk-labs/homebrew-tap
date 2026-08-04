class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.22"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.22/boardwalk-darwin-arm64"
      sha256 "8387c41851fa8db364e69c3092b691f0e5c3e9ca51a74cc6cca2508b737c8ee1"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.22/boardwalk-darwin-x64"
      sha256 "3444c4ff7ea492f058b3ff0d00f7b6374fcfc9dc3a30a862252a860bfc5815e1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.22/boardwalk-linux-arm64"
      sha256 "513253d45e722971cc7ee93540964e9131cb3d1e5a4a574dfa055247429a720b"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.22/boardwalk-linux-x64"
      sha256 "165b29ba371e2d2404603b195fc5e9aee9180a614df138ebd068c39514c4e38e"
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
