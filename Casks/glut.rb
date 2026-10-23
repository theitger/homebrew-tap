cask "glut" do
  version "0.2.0"
  sha256 "9d45537e0f76ce3ac1d440083c633cacd76f53436ccc56dec1020dc6d6c23bc1"

  url "https://github.com/theitger/glut/releases/download/v#{version}/Glut-#{version}.zip"
  name "Glut"
  desc "Temperature monitoring and fan control"
  homepage "https://github.com/theitger/glut"

  depends_on macos: :sonoma

  app "Glut.app"

  zap trash: "~/Library/Preferences/dev.theitger.glut.plist"

  caveats <<~EOS
    Glut is ad-hoc signed and is not Apple-notarized.
    If macOS blocks the first launch, allow Glut in
    System Settings > Privacy & Security > Open Anyway.
  EOS
end
