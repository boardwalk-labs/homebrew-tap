class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.15"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.15/boardwalk-darwin-arm64"
      sha256 "e1736c448751e8db4463117c0b4de7bdb0f458060da851766e8b906982b2c196"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.15/boardwalk-darwin-x64"
      sha256 "91cfe687706f394d66836514542805aa5c156a9cad23a8e9899e21ee97b12904"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.15/boardwalk-linux-arm64"
      sha256 "22467401ba530d968adb24a49be835b96652df496cd5b00487417c717f8d7ead"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.15/boardwalk-linux-x64"
      sha256 "8dbe15f30473a5c3c694f53fa0fa1a4579c6d756d4d13db827ccb114564c7350"
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
