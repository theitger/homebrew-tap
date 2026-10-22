cask "crema" do
  version "1.0.1"
  sha256 "9b838a8d205232c0cf9e3644dfe37bb8606100e361d63de69cd79465394b450a"

  url "https://github.com/theitger/crema/releases/download/v#{version}/Crema-#{version}.zip"
  name "Crema"
  desc "Keeps the computer awake from the menu bar, one shot at a time"
  homepage "https://github.com/theitger/crema"

  depends_on macos: :ventura

  app "Crema.app"

  # Ad-hoc signed (no Apple Developer certificate): without this Gatekeeper
  # blocks the first launch. The download is pinned by sha256 above.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Crema.app"]
  end

  zap trash: "~/Library/Preferences/com.theitger.crema.plist"
end
