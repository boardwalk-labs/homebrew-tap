class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.11"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.11/boardwalk-darwin-arm64"
      sha256 "a834cbdcf91a4e27c24579ac4fddc571c58264bb73fcceeda24ab1e4396238a1"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.11/boardwalk-darwin-x64"
      sha256 "b34a9a76544e0b22a844f4db4c74f09a6c5b263abc5eb80fa1b0522bc967f52f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.11/boardwalk-linux-arm64"
      sha256 "b11058a51b08ea1ee558f28778ab148db8d8a906aef3359c5884173e2fe12a6b"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.11/boardwalk-linux-x64"
      sha256 "d11b5e551fe3440f1b9fae7daf3269c7478317e7d821d8ced7932f719cbb4f48"
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
