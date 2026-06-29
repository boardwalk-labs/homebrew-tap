class Boardwalk < Formula
  desc "The boardwalk CLI: author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  # url + sha256 are rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  url "https://registry.npmjs.org/@boardwalk-labs/cli/-/cli-0.1.27.tgz"
  sha256 "18dda85609b4d1008f921334f2da0064d908a5eab5fa5001390f705bca15bd82"
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
