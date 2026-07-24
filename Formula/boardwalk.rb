class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.1"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.1/boardwalk-darwin-arm64"
      sha256 "e1c6c7b62d31b3566cec74e7e002b016eef1b5630deeba8e0976664c4291b386"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.1/boardwalk-darwin-x64"
      sha256 "2722b5bf7b9fe95f6927ae7741db9f3776f5f0366dd769cb15b794eae29df676"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.1/boardwalk-linux-arm64"
      sha256 "a269098ef67766c988297979188566d2a20c6b277cb758bfab829e91475ad5ac"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.1/boardwalk-linux-x64"
      sha256 "efac58766c83c48799d349b2a036d04996ded3e61c8e1e949f47f49965cbc469"
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
