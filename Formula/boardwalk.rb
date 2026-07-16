class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.6"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.6/boardwalk-darwin-arm64"
      sha256 "0ee23e4aa0a3706889a3f6566f59302518f6651e21d96094ae55098fe047e245"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.6/boardwalk-darwin-x64"
      sha256 "e561f895356723041a5765adfda5015bfd9987c404a8d211afe49e2ca0721625"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.6/boardwalk-linux-arm64"
      sha256 "866b1567ff906003dec90b519040ce339afccb30a5fa6a8eb1585f9de5fbae8f"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.6/boardwalk-linux-x64"
      sha256 "8c0604cba33ca879a79207419358214f44e563f65ea780ae7ec3ea32bef7ae09"
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
