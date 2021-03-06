require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-1.7.0.tgz"
  sha256 "e611822a821517acb240aabb874ccc3caa89bd34ee6cf75c1c2f1f172a73c6f2"

  bottle do
    sha256 "59c089a2fffa320b18e1399c87deaa5871b9b6d1974a69eff9dd08b300818e01" => :high_sierra
    sha256 "288dc809f9650c9122b03eaeba84012928b4d242162718c428ecf20a902ff86e" => :sierra
    sha256 "3fb2763734f620ccf53f43a293b86390315b7f93a36bef6db697e33e7a79873d" => :el_capitan
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "--skip-install", "angular-homebrew-test"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
