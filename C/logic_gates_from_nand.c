// DeMorgan's Law{
//      not(a or b)  = (not a) and  (not b)
//          a or b   = (not a) nand (not b)
//
//      not(a and b) = (not a) or   (not b)
//          a and b  = (not a) nor  (not b)  
// }

bool nand(bool a, bool b) {
    // not (a and b)
    return !(a && b);
}

bool not(bool in) {
    // not (in and in)
    return nand(in, in);
}

bool and(bool a, bool b) {
    // (a nand b) nand (a nand b)
    return not(nand(a, b));
}

bool or(bool a, bool b) {
    // not(a or b) = (not a) and (not b)
    // (a nand a) nand (b nand b)
    return nand(not(a), not(b));
}

bool nor(bool a, bool b) {
    // not (a or b)
    return not(or(a, b));
}

bool xor(bool a, bool b) {
    // ((not a) and b) or (a and (not b))
    return or(and(not(a), b), and(a, not(b)));
}
