{
  description = "Dotnet 8 microservices development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
    devShells.${system}.default =  pkgs.mkShell {
      buildInputs = [
        pkgs.dotnetCorePackages.dotnet_8.sdk
        pkgs.dotnet-aspnetcore_8
        pkgs.netcoredbg
        pkgs.omnisharp-roslyn
        pkgs.docker-compose
        pkgs.git
        pkgs.kubectl
        pkgs.talosctl
        pkgs.curl
      ];
      shellHook = ''
        echo 'Dotnet enviroment ready'
        '';
    };

  };
}
