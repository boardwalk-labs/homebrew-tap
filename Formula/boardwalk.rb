class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.7"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.7/boardwalk-darwin-arm64"
      sha256 "c39163b651037798e49fd2e0cb56d3806086e227786bfa6c07a1396328ec79b4"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.7/boardwalk-darwin-x64"
      sha256 "f2f6abcf29c599b1a21b64454a775d7ae7eaa07cc4c94dec4312539c4bb11448"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.7/boardwalk-linux-arm64"
      sha256 "8d817204157c188b374fddb286114efa386c620af5c55e8e8d672e2b6e4ca77c"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.7/boardwalk-linux-x64"
      sha256 "dfe7dd70f5a2b4bc4c63ff46f0e57ab90744e07a32bf3abcb2bef5ab40e6b4e9"
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
