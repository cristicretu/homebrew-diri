cask "diri" do
  version "0.9.6"
  sha256 "f76286be573689528d3d9653bb2b6fa109128c6b61569f15ccf724933f06d4fc"

  url "https://github.com/cristicretu/diri/releases/download/v#{version}/diri-#{version}-universal.dmg"
  name "diri"
  desc "Best way to work with coding agents"
  homepage "https://github.com/cristicretu/diri"

  livecheck do
    url :url
    strategy :github_latest
  end

  # diri ships its own updater (Developer ID + notarization pinned to the
  # running app; see diri/UPDATING.md). Declaring this keeps `brew upgrade`
  # from fighting it -- Homebrew will not reinstall over a build the app
  # updated itself to, and `brew outdated` stops reporting a version skew that
  # is not actually stale.
  auto_updates true
  depends_on macos: :sequoia

  app "diri.app"

  # Deliberately NOT zapping ~/Library/Application Support/Dirijor: that is the
  # daemon's state -- session records, hosts.json, live holder specs -- and it
  # is shared with the legacy Dirijor.app. Uninstalling the client must never
  # destroy the user's sessions.
  zap trash: [
    "~/Library/Application Support/diri",
    "~/Library/Caches/diri",
    "~/Library/Preferences/com.dirijor.diri.plist",
    "~/Library/Saved Application State/com.dirijor.diri.savedState",
  ]
end
