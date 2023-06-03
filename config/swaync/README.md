source: https://gist.githubusercontent.com/Kvn0l/4f0470ef312e4c74284755259a8d41f5/raw/3ac573945327942e04995db97d063dc8a03f51db/config.json
removed segments:

'''json
      "menu#powermode-buttons": {
        "label": "", 
        "position": "right",
        "actions": [ 
          {
            "label": "Performance",
            "command": "powerprofilesctl set performance"
          },
          {
            "label": "Balanced",
            "command": "powerprofilesctl set balanced"
          },
          {
            "label": "Power-saver",
            "command": "powerprofilesctl set power-saver"
          }
        ]
      },
  
 "menu#screencast-buttons": {
        "label": "",
        "position": "left",
        "actions": [
          {
            "label": "   Entire screen",
            "command": "swaync-client -cp && sleep 1 && recording.sh toggle fullscreen"
          },
          {
            "label": "   Select a region",
            "command": "swaync-client -cp && sleep 1 && recording.sh toggle region"
          },
          {
            "label": "   Stop",
            "command": "swaync-client -cp && recording.sh stop"
          },
          {
            "label": "   Open screencast folder",
            "command": "$XDG_VIDEOS_DIR/Screencasts"
          }
        ]
      }
'''
