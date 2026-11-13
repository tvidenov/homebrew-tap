cask "agentdock" do
  version "1.5.3"
  sha256 "adb2178e47c55f121fd3361b3e6c4add56764bf154100e238e587e9eb25e3cfd"

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
