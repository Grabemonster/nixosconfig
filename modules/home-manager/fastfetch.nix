{...}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      
  "$schema"= "https=//github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
  "logo"= {
    "source"= "xenia";
    "color"= {
      "1"= "1;97";
      "2"= "red";
      "3"= "yellow";
    };
  };
  "display"= {
    "separator"= " \u001b[33m  ";
    "color"= "red";
  };
  "modules"= [
    {
      "type"= "custom";
      "format"= "\u001b[1m—————————————————————————————————————";
    }
    {
      "type"= "host";
      "key"= "󰌢 ";
    }
    {
      "type"= "cpu";
      "key"= " ";
    }
    {
      "type"= "gpu";
      "key"= "󰢮 ";
    }
    {
      "type"= "disk";
      "folders"= "/";
      "key"= " ";
    }
    {
      "type"= "memory";
      "format"= "{/1}{-}{/}{/2}{-}{/}{} / {}";
      "key"= " ";
    }
    {
      "type"= "display";
      "compactType"= "original";
      "key"= "󰍹 ";
    }

    {
      "type"= "custom";
      "format"= "\u001b[1m—————————————————————————————————————";
    }
    {
      "type"= "os";
      "format"= "{3} {12}";
      "key"= "󰍛 ";
    }
    {
      "type"= "kernel";
      "format"= "{1} {2}";
      "key"= " ";
    }
    {
      "type"= "wm";
      "key"= " ";
    }
    {
      "type"= "shell";
      "key"= " ";
    }
    {
      "type"= "terminal";
      "key"= " ";
    }
    {
      "type"= "packages";
      "key"= "󰆧 ";
    }
    {
      "type"= "uptime";
      "key"= "󰅐 ";
    }
    {
      "type"= "command";
      "text"= "date -d @$(stat -c %W /persist) '+%a %b %d %r %Z %Y'";
      "key"= "󰶡 ";
    }

    {
      "type"= "custom";
      "format"= "\u001b[1m—————————————————————————————————————";
    }
    {
      "type"= "custom";
      "format"= "\u001b[90m󰮯   \u001b[31m󰊠   \u001b[32m󰊠   \u001b[33m󰊠   \u001b[34m󰊠   \u001b[35m󰊠   \u001b[36m󰊠   \u001b[37m󰊠";
    }
  ];

    }; 
  };
}
