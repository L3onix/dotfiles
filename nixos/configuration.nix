# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware/intelgpu.nix

      ./networking.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;


  # Set your time zone.
  time.timeZone = "America/Araguaina";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  # Fcitx5
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
    ];
  };
  	

  # Hardware
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
  };

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "alt-intl";
  #   options = "caps:swapescape";
  # };

  # Pipewire
  # services.pipewire = {
  #   enable = true;
  #   # alsa.enable = true;
  #   # alse.support32Bit = true;
  #   # pulse.enable = true;
  # };

  # Bluetooth
  services = {
    blueman = {
      enable = true;
    };
    pipewire = {
      enable = true;
    };
    xserver = {
      xkb = {
        layout = "us";
        variant = "alt-intl";
        options = "caps:swapescape";
      };
    };
  };



  # Mount ACEROLA
  fileSystems."/mnt/acerola" = {
    device = "/dev/disk/by-uuid/f29d3045-1833-4035-b647-8e9613ac146c";
    fsType = "btrfs";
    options = [
      "defaults"
      "noatime"
      "rw"
      "x-gvfs-show"
      "x-gvfs-name=acerola"
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.l3onix = {
    isNormalUser = true;
    description = "Leonardo Facundes";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "podman"
      "render"
      "video"
    ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment = with pkgs; {
    systemPackages = [
      adwaita-qt
      adwaita-qt6
      adwaita-icon-theme
      adwaita-icon-theme-legacy
      amberol
      anytype
      beekeeper-studio
      blueman
      brave
      btop
      cliphist
      chromium
      discord
      docker
      docker-compose
      drawio
      emacs
      fastfetch
      git
      gnome-calendar
      gnome-calculator
      gnome-disk-utility
      gnome-keyring
      gnome-text-editor
      gparted
      gvfs
      hyprland
      hyprshot
      hyprpaper
      hyprsunset
      hyprpolkitagent
      kitty
      lazygit
      libappindicator
      loupe
      mako
      neovim
      nautilus
      obs-studio
      # obs-studio-plugins.obs-move-transition
      # obs-studio-plugins.obs-pipewaire-audio-capture
      # obs-studio-plugins.obs-scene-as-transition
      # obs-studio-plugins.obs-vkcapture
      obsidian
      podman
      protonup-qt
      rofi
      satty
      slack
      showtime
      sushi
      swaynotificationcenter
      tmux
      unrar
      vscode
      waybar
      wiremix
      wl-clipboard
      wl-clip-persist
      xcursor-pro
      xdg-desktop-portal-hyprland
      xdg-user-dirs
      xdg-user-dirs-gtk
      xrandr
      yazi
    ];
  };



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Steam
  programs.steam = {
    enable = true;
    # extraCompatPackages = with pkgs; [ proton-ge-bin ];
    gamescopeSession.enable = true;
  };

  # Gamemode
  programs.gamemode.enable = true;

  # Gamescope
  programs.gamescope = {
    enable = true;
    enableWsi = true;
    capSysNice = true;
  };

  # GNOME Calendar
  programs.dconf.enable = true;
  services.gnome.evolution-data-server.enable = true;
  # services.gnome.gnome-online.accounts.enable = false;
  # services.gnome.gnome-keyring.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    adwaita-fonts
    liberation_ttf
    nerd-fonts.adwaita-mono
    nerd-fonts.caskaydia-mono
    nerd-fonts.code-new-roman
    nerd-fonts.droid-sans-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # Docker
  virtualisation.docker.enable = true;

  # ZSH
  programs.zsh.enable = true;
  
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # ZRAM
  zramSwap.enable = true;

  # List services that you want to enable:

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
