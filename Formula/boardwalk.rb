class Boardwalk < Formula
  desc "The boardwalk CLI: author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  # url + sha256 are rewritten by the CLI release workflow's bump-homebrew job on each tagged
  # release. Until the first release lands they point at a not-yet-published tarball on purpose.
  url "https://registry.npmjs.org/@boardwalk-labs/cli/-/cli-0.1.0.tgz"
  sha256 "19c59d5b1c1344e6d6e78a8fdc1c4dc5c805970cf68b97e8ade98f4604d2b829"
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
