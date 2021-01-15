==== Source: a ====
import "b";
uint constant c = d;
==== Source: b ====
import "a" as M;
uint constant b = M.c;
uint constant d = b;
contract C {
    uint constant a = b;
    function f() public returns (uint t) {
        assembly {
            t := a
        }
    }
}
// ----
// TypeError 7615: (b:178-179): Only direct number constants and references to such constants are supported by inline assembly.
