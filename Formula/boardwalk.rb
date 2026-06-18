class Boardwalk < Formula
  desc "The boardwalk CLI: author, validate, run, and deploy Boardwalk workflows"
  homepage "https://github.com/boardwalk-labs/cli"
  # url + sha256 are rewritten by the CLI release workflow's bump-homebrew job on each tagged release.
  url "https://registry.npmjs.org/@boardwalk-labs/cli/-/cli-0.1.18.tgz"
  sha256 "1723f92c8a4fd1df79c4a95d8c486de8d999c992a992d2603abd4c08fda37de0"
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
