{ pkgs, ... }: {
  home.username = "Swarsel";
  home.homeDirectory = "/home/Swarsel";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
 nixpkgs.config = {
  allowUnfree = true;
  allowUnfreePredicate = (pkg: true);
};
 
  home.packages = with pkgs; [
  		firefox
		sway
		wofi
		kitty
		waybar
		git
		gh
		networkmanagerapplet
		blueman
		schildichat-desktop-wayland
		discord
		mako
		xournalpp
		wl-clipboard
		];

  programs.git = {
  enable = true;
  };

  programs.zsh = {
  enable = true;
  envExtra = ''
    export EDITOR="emacsclient -c"
  '';
  
  initExtra = ''
  source $HOME/.zsh/aliases

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

##############################################################################
# History Configuration
##############################################################################

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh/history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# make sure emacs server is running
export ALTERNATE_EDITOR=""
export PATH=/usr/lib/qt45/qt/bin:/usr/lib/qt45/qt/include:$PATH
'';
  };

}