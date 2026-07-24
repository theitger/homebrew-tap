class Lernspiegel < Formula
  desc "Mirror Uni Münster Learnweb (Moodle) courses to local files (CLI + MCP)"
  homepage "https://github.com/theitger/lernspiegel"
  url "https://github.com/theitger/lernspiegel/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7b2f3398c3f3de4b4270d1bc0a6dd625ab75ae619dcbdab6cd50ad4ea66a6e4e"
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
