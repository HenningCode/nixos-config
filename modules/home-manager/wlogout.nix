{ pkgs, user, theme, ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit 0";
        "text" = "        ";
      }

      {
        "label" = "lock";
        "action" = "swaylock";
        "text" = "        ";
      }


      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "        ";
      }

      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "        ";
      }

      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "        ";
      }
    ];
    style = ''
      * {
          background-image: none;
        }
        window {
            font-family: JetBrains Mono Nerd Font;
            font-size: 14pt;
            color: #ffffff; /* text */
            background-color: rgba(46, 52, 64, 0);
        }
        button {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
            border: none;
            background-color: rgba(30, 30, 46, 0);
            margin: 5px;
            color: #ffffff;
            transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
        }
        button:focus, button:active, button:hover {
          background-color: #b9b1e2;
          outline-style: none;
        }

        #lock {
            background-image: image(url("/home/wilf/.config/wlogout/icons/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
        }

        #logout {
            background-image: image(url("/home/wilf/.config/wlogout/icons/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
        }

        #suspend {
            background-image: image(url("/home/wilf/.config/wlogout/icons/suspend.png"), url("/usr/local/share/wlogout/icons/suspend.png"));
        }

        #hibernate {
            background-image: image(url("/home/wilf/.config/wlogout/icons/hibernate.png"), url("/usr/local/share/wlogout/icons/hibernate.png"));
        }

        #shutdown {
            background-image: image(url("/home/wilf/.config/wlogout/icons/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
        }

        #reboot {
            background-image: image(url("/home/wilf/.config/wlogout/icons/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
        }
    '';
  };
}
