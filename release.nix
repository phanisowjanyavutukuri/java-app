derivation {
name = "foo";
system = "x86 64-linux";
builder = builtins.toFile "builder.sh"
mkdir -p "$out"
echo "Hello, world!" > "$out/some-result"
;
