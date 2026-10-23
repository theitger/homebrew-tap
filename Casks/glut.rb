cask "glut" do
  version "0.1.1"
  sha256 "f0ff434aec6617d10373f5ce60ad0df40cf75c5e4fcd60d984ad150dc456ce4e"

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
