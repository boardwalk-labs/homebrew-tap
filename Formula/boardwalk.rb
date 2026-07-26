class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.6"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.6/boardwalk-darwin-arm64"
      sha256 "3d9729b1564d174cc74ca78eac2075244512ed14c531e81a2ec20c87c566d7b5"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.6/boardwalk-darwin-x64"
      sha256 "66b69b1aa6054696e5ad2728bb8b98c5b987b20d1fac0756be49d7f2401020b7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.6/boardwalk-linux-arm64"
      sha256 "204e499bd5b05259f9102a06f47fd6b37955c9bdfd90aa00534e0c79e450beff"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.6/boardwalk-linux-x64"
      sha256 "9dfb6be16cb5c4a9ecdfe58c11dc51865de12f2251816bb624f549c897c48f10"
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
