{
  home.file.".hyper.js" = {
    enable = true;
    text = ''
      module.exports = {
        config: {
          fontFamily: 'JetBrainsMono Nerd Font, RobotoMono Nerd Font, monospace',
          fontSize: 10,
          fontWeight: 'normal',
          fontWeightBold: 'bold',
          lineHeight: 1,
          padding: '2px 6px',
          udpateChannel: 'canary',
        },
        plugins: [
          "hyper-highlight-active-pane",
          "hyper-pane",
          "hyper-search",
          "hyper-tab-icons",
          "hypergoogle",
          "hyperlinks",
          "hyperterm-paste",
          "hyperterm-tabs",
        ],
      };
    '';
  };
}
