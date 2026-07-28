class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.13"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.13/boardwalk-darwin-arm64"
      sha256 "08732024045255ee8f6b6eae05083dd39cc2205e268ffb55df3293c43bbff413"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.13/boardwalk-darwin-x64"
      sha256 "45d1e862284183b5aa1e8ca4a5799262fb30afe5ca6a1dab3ff31dc07426b62f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.13/boardwalk-linux-arm64"
      sha256 "7d34eeaf59a68f294c5e469d71937e5b6ca1903be08daf21a4b2e506b3a71a1f"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.13/boardwalk-linux-x64"
      sha256 "a1d15ae3daedb5290e79de4c62238119337cf6418937a7e46491ce55140caf70"
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
