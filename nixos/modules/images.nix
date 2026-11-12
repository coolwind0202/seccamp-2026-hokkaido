{ pkgs, self, lib, ... }:

let
  imageParams = [
    {
      imageName = "quay.io/frrouting/frr";
      finalImageName = "quay.io/frrouting/frr";
      finalImageTag = "10.2.1";
      imageDigest = "sha256:e47e67bd612030cb1bedee2bde85b73913f2ea021573b749deb21d94940f03c1";
      sha256 = "sha256-D0S6KNzcx6eNBP833RQWFe3751aD5TA6F0KE+sV6Oec=";
      arch = "arm64";
    }
    {
      imageName = "ghcr.io/nicolaka/netshoot";
      finalImageName = "ghcr.io/nicolaka/netshoot";
      finalImageTag = "v0.16";
      imageDigest = "sha256:b09d9b21381f47a79b3cbcb30da25266dc17186ea00ae65e99fdc51396f48e70";
      sha256 = "sha256-qxB883TSFesDprvJ0zLxp5Qtdtxfi8FKIWJPInTi06o=";
      arch = "arm64";
    }
    {
      imageName = "docker.io/dockurr/dnsmasq";
      finalImageName = "docker.io/dockurr/dnsmasq";
      finalImageTag = "latest";
      imageDigest = "sha256:b40fbaa3a9c3742d5943a4bec789dabc6c5c932b2db76a4e052c84f0b8d173a2";
      sha256 = "sha256-Z8udf3sh2JRvmQUrW7XWOyQGioC5d8VHZRrQ2zH3+hs=";
      arch = "arm64";
    }
    {
      imageName = "docker.io/sflow/ddos-protect";
      finalImageName = "docker.io/sflow/ddos-protect";
      finalImageTag = "latest";
      imageDigest = "sha256:1777de2567d18ff138c9b540d64281b83154ff2a1a92d062170bb86a885549b5";
      sha256 = "sha256-DXAugtfU6SuSa7zY3qEZ+vtHIa4br4KfWt4r5O4cgms=";
      arch = "arm64";
    }
    {
      imageName = "docker.io/sflow/host-sflow";
      finalImageName = "docker.io/sflow/host-sflow";
      finalImageTag = "latest";
      imageDigest = "sha256:2b11492dfe0d9eb3c3e0553dad05d1436577fde45d4066d27054862a57bd8b6a";
      sha256 = "sha256-/2CImkikpRLGUIvGA3iTCZQ7lSFIIptdSCRA1v4PlaU=";
      arch = "arm64";
    }
    {
      imageName = "ghcr.io/exa-networks/exabgp";
      imageDigest = "sha256:fb3805aeea7d356a2d28c29dc3602079c0ef2684a60ecd9da8f7f0fe5560cf71";
      sha256 = "sha256-f6iGrIliTsC0fuj5XxDuH3K1yuKVIxNVzgmF90qwD+Y=";
      finalImageName = "ghcr.io/exa-networks/exabgp";
      finalImageTag = "latest";
      arch = "arm64";
    }
  ];

  preloadedImages = map pkgs.dockerTools.pullImage imageParams;

  loadCommands = lib.concatMapStringsSep "\n"
    (img: "${pkgs.docker}/bin/docker load -i ${img}")
    preloadedImages;
in
{
  systemd.services.load-docker-images = {
    description = "Load pre-fetched Docker images for containerlab";
    wantedBy = [ "multi-user.target" ];
    after = [ "docker.service" ];
    requires = [ "docker.service" ];
    script = loadCommands;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
