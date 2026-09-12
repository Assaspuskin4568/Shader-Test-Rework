/// @description Key C - Character Next
if (exe) {
    char++;
    if (char > EXE_EXELLER) {
        exe = false;
        char = CHARACTER_TAILS;
    }
} else {
    char++;
    if (char > CHARACTER_SALLY) {
        exe = true;
        char = EXE_ORIGINAL;
    }
}

ind = -1;
anim_index = 0;
alt_anim = false;