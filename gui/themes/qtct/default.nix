{ pkgs
, ... 
}:
let
  catppuccinMacchiato = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "qt5ct";
    rev = "main";
    sha256 = "197yivsclcjxp2819vpxj5adqfyrsi29m75lqsmdxapv8lmv5yxp";
  };
in {
  themePath = "${catppuccinMacchiato}/themes/Catppuccin-Macchiato.conf";
}

