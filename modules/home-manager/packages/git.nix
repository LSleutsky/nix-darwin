{ config, lib, pkgs, ... }:

{
  programs = {
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        commit-decoration-style = "bold box ul #450eff";
        file-decoration-style = "#606018 ul";
        line-numbers = true;
        side-by-side = true;
      };
    };
    gh = {
      enable = true;
	    settings = {
		    editor = "nvim";
		    git_protocol = "https";
		    pager = "less";
		    aliases = {
			    rc = "repo create";
			    rcl = "repo clone";
		    };
	    };
    };
    git = {
      enable = true;
      package = pkgs.git;
      ignores = [
        ".DS_Store"
        "*.log"
        "node_modules"
        ".npm"
        "*.swp"
        "Thumbs.db"
        ".yarn"
      ];
      settings = {
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
        push = {
          autoSetupRemote = true;
        };
        safe = {
          directory = "$HOME/.local/share/nvim/lazy/*";
        };
        user = {
          email = "LushSleutsky@gmail.com";
          name = "LSleutsky";
        };
      };
    };
  };
}
