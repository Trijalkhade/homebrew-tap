cask "habit-calendar" do
  version "0.1.0"
  sha256 "ceda433d88c856e41845d3290dbbced9888e42739d7f0012b53317bfaa31094d"

  url "https://github.com/Trijalkhade/habit-calendar/releases/download/v#{version}/Habit.Calendar_#{version}_universal.dmg"
  name "Habit Calendar"
  desc "A local habit-accountability calendar app"
  homepage "https://github.com/Trijalkhade/habit-calendar"

  app "Habit Calendar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Habit Calendar.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.habitcalendar.desktop",
    "~/Library/Caches/com.habitcalendar.desktop",
    "~/Library/Preferences/com.habitcalendar.desktop.plist",
  ]
end
