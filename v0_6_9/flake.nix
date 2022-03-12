{
  description = ''Nimterop makes C/C++ interop within Nim seamless'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimterop-v0_6_9.flake = false;
  inputs.src-nimterop-v0_6_9.owner = "genotrance";
  inputs.src-nimterop-v0_6_9.ref   = "refs/tags/v0.6.9";
  inputs.src-nimterop-v0_6_9.repo  = "nimterop";
  inputs.src-nimterop-v0_6_9.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimterop-v0_6_9"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimterop-v0_6_9";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}