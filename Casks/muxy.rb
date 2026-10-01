cask "muxy" do
  version "0.2.1"
  sha256 "fca1921d9644c82c11589b27ed858ff40db41f2dea5f8d83983b293abf1c63fa"

  url "https://github.com/theitger/muxy/releases/download/v#{version}/Muxy-#{version}.zip"
  name "Muxy"
  desc "Terminal workspace for parallel coding agents with native Ghostty rendering"
  homepage "https://github.com/theitger/muxy"

  depends_on macos: :sonoma

  app "Muxy.app"

  caveats <<~EOS
    Muxy is ad-hoc signed (no Apple Developer certificate). macOS will
    block the first launch unless you clear the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/Muxy.app
  EOS
end
