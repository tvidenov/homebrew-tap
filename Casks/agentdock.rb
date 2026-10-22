cask "agentdock" do
  version "1.4.0"
  sha256 "ba65099f89482f32504a7ed4e0b7222bdc5c27638ecda7ee730c97361ca0e144"

  url "https://github.com/tvidenov/AgentDock-releases/releases/download/v#{version}/AgentDock-#{version}.dmg"
  name "AgentDock"
  desc "Status dots and one Inbox for Claude Code, Codex and other coding agents"
  homepage "https://www.agentdockapp.com/"

  livecheck do
    url "https://raw.githubusercontent.com/tvidenov/AgentDock-releases/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "AgentDock.app"

  uninstall quit: "com.tihomirvidenov.AgentDock"

  zap trash: [
    "~/.agentdock",
    "~/Library/Application Support/AgentDock",
    "~/Library/Group Containers/9Q6VR23WUE.com.tihomirvidenov.AgentDock",
    "~/Library/Preferences/com.tihomirvidenov.AgentDock.plist",
  ]
end
