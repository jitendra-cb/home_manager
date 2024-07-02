{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    go
    
    # TODO: Add "go install github.cbhq.net/infra/assume-role/...@latest" to this

    # TODO: Add "go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28" to this
    # TODO: Add "go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2" to this
    # TODO: Add "go install github.cbhq.net/engineering/csf/cli/cmd/protoc-gen-csf@latest" to this
    # TODO: Add "go install github.cbhq.net/engineering/cb-service_auth/cmd/cb-serviceauth-dev-jwt@master" to this
    # TODO: Add "go install github.com/fullstorydev/grpcui/cmd/grpcui@latest" to this
    # TODO: Add "go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest" to this
    # TODO: Add "go install mvdan.cc/gofumpt@latest" to this
    # TODO: Add "go install github.com/google/yamlfmt/cmd/yamlfmt@latest" to this
  ];
}
