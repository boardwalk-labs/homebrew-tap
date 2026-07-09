class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.1.31"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.31/boardwalk-darwin-arm64"
      sha256 "81ae7a34fcd93cba42e05d7851ade3f256de10e90e5d3a0f37bd0f2e135437ee"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.31/boardwalk-darwin-x64"
      sha256 "a71439db98d48a3d62b90d420a75b6df49596797e0dd0ea85d4a4d0833d2c5b6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.31/boardwalk-linux-arm64"
      sha256 "3d95ddc1b766aeecdb336fcce551925fd5b9141f7d827dc09c19a43b75b31e68"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.1.31/boardwalk-linux-x64"
      sha256 "0f6ad17f87377f0985f8112dc151e0e3fd1ca11b0d1de1085267b7dde0b36dae"
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
