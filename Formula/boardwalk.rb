class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.2.0"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.0/boardwalk-darwin-arm64"
      sha256 "d0cd8c977d93fdcbb9444753e5117a53030290af7056d9ca76b40db283e9dc3d"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.0/boardwalk-darwin-x64"
      sha256 "9f5fa4285545fd4f0bb49675bb11c053ee419d7d00ac58dd346acadb17f203bb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.0/boardwalk-linux-arm64"
      sha256 "0b42e8c1eb2bf4f07758fd8128089877da61972203ef0a5b6267a26afe31f883"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.2.0/boardwalk-linux-x64"
      sha256 "957e9b6942360fc9ffe4ed44f5bfb117bc51d31969702db77a4f4bbcbad19ea9"
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
