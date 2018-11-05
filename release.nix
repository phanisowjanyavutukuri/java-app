let
  pkgs = import <nixpkgs> {}; 1

  jobs = rec { 2

    tarball = 3
      pkgs.releaseTools.sourceTarball { 4
        name = "hello-tarball";
        src = <hello>; 5
        buildInputs = (with pkgs; [ gettext texLive texinfo ]);
      };

    build = 6
      { system ? builtins.currentSystem }:  7

      let pkgs = import <nixpkgs> { inherit system; }; in
      pkgs.releaseTools.nixBuild { 8
        name = "hello";
        src = jobs.tarball;
        configureFlags = [ "--disable-silent-rules" ];
      };
  };
in
  jobs 9
      
