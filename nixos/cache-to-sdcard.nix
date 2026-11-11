{ pkgs, self, ... }:

{
  systemd.services.setup-repo = {
    description = "Copy repository contents to user home directory";
    wantedBy = [ "multi-user.target" ];
    script = ''
      DEST_DIR="/home/user/work"
      
      if [ ! -d "$DEST_DIR" ]; then
        mkdir -p "$DEST_DIR"
        
        cp -r ${self}/. "$DEST_DIR/"
        
        chown -R user:users "$DEST_DIR"
        chmod -R u+w "$DEST_DIR"
      fi
    '';
    serviceConfig.Type = "oneshot";
  };
}
