class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.4"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.4/boardwalk-darwin-arm64"
      sha256 "6708f4cbef13dd1bc324d4e60991ca173ca34dcf20954050c655aac6c8347f5d"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.4/boardwalk-darwin-x64"
      sha256 "e6a530c4acd69de7efb117ae53011044272b018da384629cee54dfb4abe9319d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.4/boardwalk-linux-arm64"
      sha256 "6e9182b2233548cf2faae773ac70dc25d837adfac8035f2bb205e4af959c0d57"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.4/boardwalk-linux-x64"
      sha256 "ebc63363a8d84c40a56aeb67ed069c45b01ae5679add961916f4169b32aa78a3"
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
