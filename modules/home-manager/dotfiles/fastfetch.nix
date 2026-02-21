{
  xdg.configFile."fastfetch/config.jsonc" = {
    enable = true;
    text = ''
      {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "display": {
          "separator": " "
        },
        "modules": [
          {
            "key": "╭───────────╮",
            "type": "custom"
          },
          {
            "key": "│ {#34}{icon} distro  {#keys}│",
            "type": "os",
            "format": "{name} {version}",
          },
          {
            "key": "│ {#35} kernel  {#keys}│",
            "type": "kernel"
          },
          {
            "key": "│ {#36}󰇄 desktop {#keys}│",
            "type": "de"
          },
          {
            "key": "│ {#31} term    {#keys}│",
            "type": "terminal"
          },
          {
            "key": "│ {#32} shell   {#keys}│",
            "type": "shell"
          },
          {
            "key": "│ {#33}󰍛 cpu     {#keys}│",
            "type": "cpu",
            "format": "{1} @ {7}"
          },
          {
            "type": "gpu",
            "key": "│ {#35}󰢮 gpu     {#keys}│",
            "hideType": "integrated",
            "format": "{1} {2}"
          },
          {
            "key": "│ {#34}󰉉 disk    {#keys}│",
            "type": "disk",
            "folders": "/"
          },
          {
            "key": "│ {#36} memory  {#keys}│",
            "type": "memory"
          },
          {
            "key": "│ {#33}󰅐 uptime  {#keys}│",
            "type": "uptime"
          },
          {
            "key": "├───────────┤",
            "type": "custom"
          },
          {
            "key": "│ {#39} colors  {#keys}│",
            "type": "colors",
            "symbol": "circle"
          },
          {
            "key": "╰───────────╯",
            "type": "custom"
          }
        ]
      }
    '';
  };
}
