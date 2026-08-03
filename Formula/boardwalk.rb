class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.20"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.20/boardwalk-darwin-arm64"
      sha256 "57159697aaf87d18201c8833a79d72e84cc72d48e6785eab42b460aed2eec505"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.20/boardwalk-darwin-x64"
      sha256 "bda05bda0c07a1d4eac9ae10f2d0c141b865200c4a888e29e0ae81d7ce196a36"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.20/boardwalk-linux-arm64"
      sha256 "eabe30a848c199f6b7ad8d98959f46bf80adada2ae5c9e69eec1c0d5ab9eb92f"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.20/boardwalk-linux-x64"
      sha256 "b066d062543401b651b08bb12a4b645f20a77e5609cf6f38cf316ceefe794e31"
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
