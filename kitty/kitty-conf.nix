{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.7
      font_size 13
      confirm_os_window_close 0
    '';
  };
}
