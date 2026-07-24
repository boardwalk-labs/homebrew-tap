class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.2"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.2/boardwalk-darwin-arm64"
      sha256 "b5722f5f208dff10dd99d37090cb070b6347943e605c6c7f60106dc7621691b1"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.2/boardwalk-darwin-x64"
      sha256 "00dc7c39391a4d98202baa506a33d0fbc20fcf3f4976c97d8ef37541476bc92d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.2/boardwalk-linux-arm64"
      sha256 "09af7f67e1408c36bf2d634e5152c5a1c4f3fc56850cbca7573cb1d6e6ce2215"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.2/boardwalk-linux-x64"
      sha256 "4754ef8126005607cb3cfa904579a879b8e006fec7837c45028076dd841db904"
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
