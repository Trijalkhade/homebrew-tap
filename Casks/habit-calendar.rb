cask "habit-calendar" do
  version "0.1.0"
  sha256 "02990bda226a68727692ccf68470b05a37950d453dcdfd164e274856c92b8796"

  url "https://github.com/Trijalkhade/habit-calendar/releases/download/v#{version}/Habit.Calendar_#{version}_universal.dmg"
  name "Habit Calendar"
  desc "A local habit-accountability calendar app"
  homepage "https://github.com/Trijalkhade/habit-calendar"

  app "Habit Calendar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Habit Calendar.app"]
    
    # Automatically download and extract the browser extension to ~/Documents
    system_command "/bin/bash",
                   args: [
                     "-c",
                     "mkdir -p ~/Documents/HabitCalendar-Extension && " \
                     "curl -sL https://github.com/Trijalkhade/habit-calendar/archive/refs/heads/main.zip -o /tmp/habit-repo.zip && " \
                     "unzip -q /tmp/habit-repo.zip 'habit-calendar-main/extension/*' -d /tmp/ && " \
                     "cp -R /tmp/habit-calendar-main/extension/* ~/Documents/HabitCalendar-Extension/ && " \
                     "rm -rf /tmp/habit-repo.zip /tmp/habit-calendar-main"
                   ]
  end

  caveats <<~EOS
    ⚠️ ACTION REQUIRED: Browser Extension
    The tracker extension has been automatically saved to:
    👉 ~/Documents/HabitCalendar-Extension

    To finish setup:
    1. Open your browser and go to chrome://extensions (or edge://extensions)
    2. Turn on "Developer Mode" (top right)
    3. Click "Load Unpacked" and select the folder above.
  EOS

  zap trash: [
    "~/Library/Application Support/com.habitcalendar.desktop",
    "~/Library/Caches/com.habitcalendar.desktop",
    "~/Library/Preferences/com.habitcalendar.desktop.plist",
  ]
end
