require("obvious.battery")
-- require("obvious.keymap_switch")

require("awful")

-- setxkbmap -layout us,ru
-- setxkbmap -option
-- setxkbmap -option 'grp:caps_toggle'
-- setxkbmap -option 'grp_led:caps'

awful.util.spawn_with_shell("gnome-screensaver")
-- включаем темы
awful.util.spawn_with_shell("gnome-settings-daemon")
-- открываем управление питанием
awful.util.spawn_with_shell("gnome-power-manager")
-- управление сетью
awful.util.spawn_with_shell("nm-applet")
-- авт. обновление
awful.util.spawn_with_shell("update-notifier")
awful.util.spawn_with_shell("indicator-weather")
awful.util.spawn_with_shell("gnome-sound-applet")
awful.util.spawn_with_shell("firefox")
awful.util.spawn_with_shell("skype")
awful.util.spawn_with_shell("gnome-terminal")
