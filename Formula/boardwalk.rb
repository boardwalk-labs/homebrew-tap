class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.3"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.3/boardwalk-darwin-arm64"
      sha256 "b24e29cd96cf9dc440d3fab3ba55ddf111991ec012425267f3a9ed8aa6b658cf"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.3/boardwalk-darwin-x64"
      sha256 "7134afba3793d1d50287cc9fca35e4170d1551b060b125c0b3cfaf0411d15e25"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.3/boardwalk-linux-arm64"
      sha256 "78abbfc448e4b287330e0a9d65ab524387171fbab4f9bb317b6b10f1a65a8d54"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.3/boardwalk-linux-x64"
      sha256 "ea5cfffbbf3676745a7324a62d371b99272d8a5c7e565cd90b2e4fbda2bb04f6"
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
