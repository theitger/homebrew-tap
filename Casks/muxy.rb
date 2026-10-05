cask "muxy" do
  version "0.3.0"
  sha256 "9c6e192358980edf8070afef97d7f05972dde6b5162b488fefa228bcab545dd9"

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
