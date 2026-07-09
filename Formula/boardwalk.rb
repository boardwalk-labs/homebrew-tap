class Boardwalk < Formula
  desc "The boardwalk CLI: author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  # url + sha256 are rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  url "https://registry.npmjs.org/@boardwalk-labs/cli/-/cli-0.1.31.tgz"
  sha256 "bca3b6d9dcfabad65118202caa69abfb83bcbbb2eb7a1e909989d716fa0d939f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/boardwalk --version")
  end
end
