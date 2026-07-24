class Lernspiegel < Formula
  desc "Mirror Uni Münster Learnweb (Moodle) courses to local files (CLI + MCP)"
  homepage "https://github.com/theitger/lernspiegel"
  url "https://github.com/theitger/lernspiegel/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6f9f83c4e87ac5bab4070325a54caac664c3ed7b5cadeb0ab35bc0da3b1f6944"
  license "MIT"

  depends_on "node"

  def install
    # dist/ is gitignored, so build from source during install.
    system "npm", "install", *std_npm_args(prefix: false)
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install Dir["*"]

    node = Formula["node"].opt_bin/"node"
    (bin/"learnweb").write <<~SH
      #!/bin/bash
      exec "#{node}" "#{libexec}/dist/cli.js" "$@"
    SH
    (bin/"learnweb-mcp").write <<~SH
      #!/bin/bash
      exec "#{node}" "#{libexec}/dist/mcp.js" "$@"
    SH
  end

  test do
    assert_match "learnweb", shell_output("#{bin}/learnweb --help")
  end
end
