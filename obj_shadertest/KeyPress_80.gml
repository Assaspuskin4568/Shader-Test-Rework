/// @description Key P - Palettes
var ch;
if (variable_instance_exists(id, "exe") && exe) {
    ch = char + PALETTE_EXE;
} else {
    ch = char;
    if (demon) ch += PALETTE_DEMON;
}

ind++;
if (ind > 2) {
    ind = -1;
}