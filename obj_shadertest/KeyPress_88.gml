/// @description Key X - Character Prev
if (exe) {
    char--;
    if (char < EXE_ORIGINAL) {
        exe = false;
        char = CHARACTER_SALLY;
    }
} else {
    char--;
    if (char < CHARACTER_TAILS) {
        exe = true;
        char = EXE_EXELLER;
    }
}

ind = -1;
anim_index = 0;
alt_anim = false;