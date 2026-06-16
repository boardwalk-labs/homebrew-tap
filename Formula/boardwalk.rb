class Boardwalk < Formula
  desc "The boardwalk CLI: author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  # url + sha256 are rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  url "https://registry.npmjs.org/@boardwalk-labs/cli/-/cli-0.1.15.tgz"
  sha256 "fe5cddf35335624fdbd1796008e151c9ded87667efd8aef6ffebfb861843fde4"
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
