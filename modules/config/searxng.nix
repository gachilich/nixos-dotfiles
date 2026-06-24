{ pkgs, ... }:
{
  services.searx = {
    enable = true;
    package = pkgs.searxng;
    redisCreateLocally = true;

    configureUwsgi = true;
    uwsgiConfig = {
      http = "127.0.0.1:8888";
    };

    settings = {
      server = {
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = "$SEARXNG_SECRET";
      };

      general = {
        instance_name = "My SearXNG";
        donation_url = false;
        contact_url = false;
        enable_metrics = false;
      };

      ui = {
        query_in_title = true;
        infinite_scroll = true;
      };

      search = {
        safe_search = 0;
        autocomplete = "duckduckgo";
        formats = [ "html" "json" ];
      };
    };

    environmentFile = "/var/lib/searx/searx-secret";
  };
}
