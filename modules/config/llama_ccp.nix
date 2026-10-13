{ pkgs, ... }:

let
  user = "gachilich";
  homePath = "/home/${user}/";

  mcpFilesystem = pkgs.writeShellApplication {
    name = "mcp-filesystem";

    runtimeInputs = with pkgs; [
      nodejs_22
      bash
      coreutils
    ];

    text = ''
      exec npx -y supergateway \
        --stdio "npx -y @modelcontextprotocol/server-filesystem ${homePath}" \
        --outputTransport streamableHttp \
        --streamableHttpPath "/mcp" \
        --stateful \
        --host "127.0.0.1" \
        --port 8000
    '';
  };

  mcpSearxng = pkgs.writeShellApplication {
    name = "mcp-searxng";

    runtimeInputs = with pkgs; [
      nodejs_22
      bash
      coreutils
    ];

    text = ''
      export SEARXNG_URL="http://127.0.0.1:8888"

      # Streamable HTTP для llama.cpp WebUI.
      export MCP_HTTP_HOST="127.0.0.1"
      export MCP_HTTP_PORT="8001"

      # Ограничиваем размер поисковой выдачи.
      export SEARXNG_MAX_RESULTS="12"

      # Русский по умолчанию, можно менять в отдельных запросах.
      export SEARXNG_DEFAULT_LANGUAGE="ru"

      exec npx -y mcp-searxng
    '';
  };
in
{
  services.llama-cpp = {
    enable = true;

    package = pkgs.llama-cpp.override {
      cudaSupport = true;
    };

    settings = {
      models-dir = "/var/lib/llama-cpp/models";

      jinja = true;

      ui-mcp-proxy = true;

      n-gpu-layers = 12;
      ctx-size = 8192;

      flash-attn = "on";
      cache-type-k = "q8_0";
      cache-type-v = "q8_0";

      host = "127.0.0.1";
      port = 8080;
    };
  };
  systemd.services.llama-cpp.wantedBy = [ ];

  systemd.user.services.mcp-filesystem = {
    description = "Filesystem MCP server for Home Folder";

    after = [ "network.target" ];

    # Не запускать сервис для других пользователей.
    unitConfig.ConditionUser = user;

    serviceConfig = {
      Type = "simple";
      ExecStart = "${mcpFilesystem}/bin/mcp-filesystem";

      Restart = "on-failure";
      RestartSec = 5;
    };
  };
  systemd.user.services.mcp-searxng = {
    description = "SearXNG Web Search MCP server";

    after = [ "network.target" ];

    unitConfig.ConditionUser = user;

    serviceConfig = {
      Type = "simple";
      ExecStart = "${mcpSearxng}/bin/mcp-searxng";

      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
