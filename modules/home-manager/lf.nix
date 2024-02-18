{ pkgs, config, ...}:

{

  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;

    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        makedir $DIR
      }}
      '';
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

  };
}