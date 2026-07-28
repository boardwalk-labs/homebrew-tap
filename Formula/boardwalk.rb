class Boardwalk < Formula
  desc "Author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  version "0.3.12"
  license "MIT"

  # Native single-file binary (Bun-compiled) — no Node required. The per-platform url + sha256 are
  # rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  on_macos do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.12/boardwalk-darwin-arm64"
      sha256 "bcdee680eedb4b6e4b78e132d085aba8267ff0ce81394b107630f8b1aa286373"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.12/boardwalk-darwin-x64"
      sha256 "956414820d24ca6022dea3837f642f68a1f7e496efb89ed306c454c56fa57af2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.12/boardwalk-linux-arm64"
      sha256 "875bcde152e9fa572c97bd49e2ae5f4670e3226f7ff0737b8eeecd864b4db269"
    end
    on_intel do
      url "https://github.com/boardwalk-labs/cli/releases/download/v0.3.12/boardwalk-linux-x64"
      sha256 "45e19c4c6c3447e7704d4a88468244fdfeed99fd45ddefc47c38c188f52c75c0"
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
