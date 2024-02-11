{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    soft-serve
  ];
}
# }
#     enable = true;
#     settings = {
#       name = "Dady's repos";
#       log_format = "text";
#       ssh = {
#         listen_addr = ":23231";
#         public_url = "ssh://node-nadia:23231";
#         max_timeout = 30;
#         idle_timeout = 120;
#       };
#       stats.listen_addr = ":23233";
#     };
#   };
# }
#
