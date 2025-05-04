{...}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
  "logo"= {
    "source"= "nixos";
  };
  "display"= {
    "separator"= "   ";    
  };
  "modules"= [
    {
      "type"= "custom";
      "format"= "—————————————————————————————————————";
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
      "type"= "disk";
      "folders"= "/srv/games/";
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
      "format"= "—————————————————————————————————————";
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
  ];

    }; 
  };
}
