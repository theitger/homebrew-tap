cask "muxy" do
  version "0.1.0"
  sha256 "a0aa6bde5e42f692148784f2493be0b53a46a78e99087b66088cd8aa49a12a89"

  url "https://github.com/theitger/muxy/releases/download/v#{version}/Muxy-#{version}.zip"
  name "Muxy"
  desc "Terminal workspace for parallel coding agents with native Ghostty rendering"
  homepage "https://github.com/theitger/muxy"

  depends_on macos: ">= :sonoma"

  app "Muxy.app"

  caveats <<~EOS
    Muxy is ad-hoc signed (no Apple Developer certificate). macOS will
    block the first launch unless you clear the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/Muxy.app
  EOS
end
