class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.5"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.5/boardwalk-darwin-arm64"
      sha256 "4f8edcb44930740658a83046b6661c9e1eed60015c5bc043a421943e7cdd956c"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.5/boardwalk-darwin-x64"
      sha256 "c4970b1b3416bbd65ea5948d5de1889599b54952d52885c0f6cae2c292b3f9d4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.5/boardwalk-linux-arm64"
      sha256 "2f19f2c40c5975d60cd68c1b215ff258679c299761f69e9d99fd8025b1b95618"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.5/boardwalk-linux-x64"
      sha256 "261358c136d5264fff69471d1ef581cee6d72d557e87425cf3f5160b13c76554"
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
