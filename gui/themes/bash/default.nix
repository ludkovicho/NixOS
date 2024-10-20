{ lib
, stdenv
, fetchFromGitHub
, writeShellScriptBin
, bash
}:
stdenv.mkDerivation rec {
  pname = "oh-my-bash";
  version = "latest";
  src = fetchFromGitHub {
    owner = "ohmybash";
    repo = "oh-my-bash";
    rev = "master";
    sha256 = "sha256-Xvb4sQW4wrNbzqSXPGNtnQR/axgrVfS3juQl0FTPqvs=";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -r * $out/bin/
    ln -s $out/bin/tools/install.sh $out/bin/oh-my-bash-install
    cat > $out/bin/install-oh-my-bash << EOF
#!/usr/bin/env bash
curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash
EOF
    chmod +x $out/bin/install-oh-my-bash
  '';
  meta = with lib; {
    description = "Oh My Bash - A community-driven framework for managing your Bash configuration.";
    homepage = "https://github.com/ohmybash/oh-my-bash";
    license = licenses.mit;
    maintainers = with maintainers; [ varmisanth ];
  };
}
