class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.14"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.14/boardwalk-darwin-arm64"
      sha256 "6b98be601ce1268af8d8909fb81579865266249c4d963811fad435ee0ee3571c"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.14/boardwalk-darwin-x64"
      sha256 "135376bcb9b2cedc56dde4b9f1e4a799eab69dc4d471c599465f812eb30e1777"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.14/boardwalk-linux-arm64"
      sha256 "5049015066603c35eae346ab2604988559eb376db43cf686e248e3d2aeb5c028"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.14/boardwalk-linux-x64"
      sha256 "7a12b2beead07e3c8c6a488eb8f713141f09911760842c61a28cd96574e7d05b"
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
