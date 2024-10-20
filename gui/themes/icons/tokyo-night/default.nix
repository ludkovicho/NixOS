{ lib
, pkgs
, stdenv
, jdupes
, autoreconfHook
, pkg-config
, gdk-pixbuf
, librsvg
, gnome3
, gnome
, gtk3
, hicolor-icon-theme
, gnome-icon-theme
, breeze-icons
, fetchurl
}:
let
  version = "44.0";
  adwaita-icon-theme-44 = pkgs.adwaita-icon-theme.overrideAttrs (oldAttrs: {
    version = version;
    src = fetchurl {
      url = "mirror://gnome/sources/adwaita-icon-theme/${lib.versions.majorMinor version}/adwaita-icon-theme-${version}.tar.xz";
      sha256 = "0k3638gkdpjcr9pbsmpfj7vdqdm9s04j4d5sh1fx5v5z3dhcb2a8";
    };
    preConfigure = ''
      unset MESON;
    '';
    configurePhase = ''
      ./configure --prefix=$out
    '';
    buildPhase = ''
      make
    '';
    installPhase = ''
      make install 
      rm -r $out/share/icons/Adwaita/symbolic/mimetypes/
      rm -r $out/share/icons/Adwaita/scalable/mimetypes/
      rm -r $out/share/icons/Adwaita/symbolic/places/
      rm -r $out/share/icons/Adwaita/scalable/places/
      rm -r $out/share/icons/Adwaita/32x32/mimetypes/
      rm -r $out/share/icons/Adwaita/16x16/mimetypes/
      rm -r $out/share/icons/Adwaita/32x32/places/
      rm -r $out/share/icons/Adwaita/16x16/places/
    '';
    dontDropIconThemeCache = true;
    passthru = {
      updateScript = gnome.updateScript {
        packageName = "adwaita-icon-theme";
        attrPath = "gnome.adwaita-icon-theme";
      };
    };
  });
in
stdenv.mkDerivation rec {
  pname = "tokyo-night-icons";
  version = "0.2.0";
  src = fetchurl {
    url = "https://github.com/ljmill/tokyo-night-icons/releases/download/v${version}/TokyoNight-SE.tar.bz2";
    sha256 = "1aln273alh7qiqfkmb2grnacxb8236l0ylyrxmjcb3qcrivam9mk";
  };
  nativeBuildInputs = [
    gtk3
  ];
  propagatedBuildInputs = [
    adwaita-icon-theme-44
    hicolor-icon-theme
    gnome-icon-theme
    breeze-icons
  ];
  dontDropIconThemeCache = true;
  dontRewriteSymlinks = true;
  dontPatchELF = true;
  installPhase = ''
    mkdir -p $out/share/icons/
    tar xjf $src -C $out/share/icons/
    gtk-update-icon-cache -q -t -f $out/share/icons/TokyoNight-SE
  '';
  meta = with lib; {
    description = "Beautiful icons theme in Tokyo Night style";
    homepage = "https://github.com/ljmill/tokyo-night-icons";
    license = licenses.unfree;
    platforms = platforms.linux;
    maintainers = [ maintainers.varmisanth ];
  };
}
