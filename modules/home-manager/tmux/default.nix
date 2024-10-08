{...}: {
  programs.tmux = {
    enable = true;
    extraConfig = "

      set-option -sa terminal-overrides \",xterm*:Tc\"
      set -g mouse on
      set -sg escape-time 50
      
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix
      
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      
      bind -n M-H previous-window
      bind -n M-L next-window
      
      # List of plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-yank'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'catppuccin/tmux'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      
      set-window-option -g mode-keys vi
      
      # Set status bar position to top
      set -g status-position top
      
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi C-v send -X rectangle-toggle
      bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
      
      # Open panes in current directory
      bind '\"' split-window -v -c \"#{pane_current_path}\"
      bind % split-window -h -c \"#{pane_current_path}\"
      
      # Automatically start tmux
      # Currently disabled because the DISPLAY env is not set correctly
      # set -g @continuum-boot 'on'
      
      # Automatically restore saved sessions
      set -g @continuum-restore 'on'
      
      set -g @catppuccin_flavour 'mocha'
      set -g @catppuccin_window_left_separator \"\"
      set -g @catppuccin_window_right_separator \" \"
      set -g @catppuccin_window_middle_separator \" █\"
      set -g @catppuccin_window_number_position \"right\"
      
      set -g @catppuccin_window_default_fill \"number\"
      set -g @catppuccin_window_default_text \"#W\"
      
      set -g @catppuccin_window_current_fill \"number\"
      set -g @catppuccin_window_current_text \"#W\"
      
      set -g @catppuccin_status_modules_right \"directory user host session\"
      set -g @catppuccin_status_left_separator  \" \"
      set -g @catppuccin_status_right_separator \"\"
      set -g @catppuccin_status_fill \"icon\"
      set -g @catppuccin_status_connect_separator \"no\"
      # set -g @catppuccin_directory_text \"#{pane_current_path}\"
      
      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run '~/.tmux/plugins/tpm/tpm'

      ";
  };
}
