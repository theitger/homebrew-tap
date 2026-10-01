cask "muxy" do
  version "0.2.0"
  sha256 "52bfaadf62955151859b1de9e4cb9036b34c8a1cc841bc3d176694dd9514d97d"

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
