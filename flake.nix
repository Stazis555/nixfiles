{
  description = "Nixos Config";

  inputs = {
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # oldnixpkgs.url = "github:nixos/nixpkgs?rev=21808d22b1cda1898b71cf1a1beb524a97add2c4";
    rust-overlay.url = "github:oxalica/rust-overlay";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, rust-overlay, hyprland-qtutils, ... }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ (import rust-overlay) ];
      lib = nixpkgs.lib;
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
          inherit system overlays;
      };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          # specialArgs = { oldnixpkgs = import oldnixpkgs { inherit system; }; };
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        stazis = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home.nix ];
        };
      };
      devShells.${system} = {
        terraform = pkgs.mkShell {
          name = "terraform";
          buildInputs = with pkgs; [
            terraform
          ];
        };
        rust = pkgs.mkShell rec {
          name = "rs";
          buildInputs = with pkgs; [
            cargo
            cargo-watch
            # rustc
            rustfmt
            rust-bin.stable.latest.default

            bump2version
            kubernetes-helm

            postgresql
            diesel-cli

            libxkbcommon
            libGL
            udev
            alsa-lib
            wayland
            vulkan-loader
            vulkan-tools
            pkg-config
	  ];
          # PKG_CONFIG_PATH = "${pkgs.wayland}/lib/pkgconfig/:${pkgs.alsa-lib}/lib/pkgsconfig/";
          LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
          shellHook = ''
            export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
          '';
	};
      };
    };
}
