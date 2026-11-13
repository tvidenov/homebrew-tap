cask "agentdock" do
  version "1.5.4"
  sha256 "3293b673106148727952dadc57c5e923b79e5d3b4b248ed9aa840481dce4d5d6"

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
