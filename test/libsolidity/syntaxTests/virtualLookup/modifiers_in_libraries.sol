library WithModifier {
    modifier mod() { require(msg.value > 10 ether); _; }
    function withMod(uint self) mod() internal view { require(self > 0); }
}

contract Test {
    using WithModifier for *;

    function f(uint _value) public payable {
        _value.withMod();
        WithModifier.withMod(_value);
    }
}
// ----
// Warning: (52-61): Modifier used in non-payable function, but this expression requires the function to be payable.
