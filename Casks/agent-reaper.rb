cask "agent-reaper" do
  version "0.1.0"
  sha256 "56e523a9eb76d3611049028b816c481757fc4d6ca1458290481597a9fbe841af"

  url "https://github.com/theitger/agent-reaper/releases/download/v#{version}/Reaper-#{version}.zip"
  name "Reaper"
  desc "Menu bar app that frees the memory coding agents leave behind"
  homepage "https://github.com/theitger/agent-reaper"

  depends_on macos: :sonoma

  app "Reaper.app"

  caveats <<~EOS
    Reaper is ad-hoc signed (no Apple Developer certificate). macOS will
    block the first launch unless you clear the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/Reaper.app
  EOS
end
