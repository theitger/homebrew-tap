cask "muxy" do
  version "0.2.2"
  sha256 "a632c19475e0bfb40595e3b02f93229c11a7291c9d07c91209f43014b4d86417"

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
