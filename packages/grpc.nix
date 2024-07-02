{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    grpc
    grpcui
    grpcurl
    grpc-gateway
  ];
}
