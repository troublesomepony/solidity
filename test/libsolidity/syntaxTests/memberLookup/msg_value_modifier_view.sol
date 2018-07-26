contract C {
    modifier costs(uint _amount) { require(msg.value >= _amount); _; }
    function f() costs(1 ether) public view {}
}
// ----
// Warning: (56-65): Modifier used in non-payable function, but this expression requires the function to be payable.
