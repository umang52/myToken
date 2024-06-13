// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // Public variables to store the details about the token
    string public name = "MyToken";          // Token Name
    string public symbol = "MTK";            // Token Abbreviation
    uint256 public totalSupply = 0;          // Total Supply of tokens

    // Mapping to store the balances of addresses
    mapping(address => uint256) public balances;

    // Event to emit when tokens are minted
    event Mint(address indexed to, uint256 amount);

    // Event to emit when tokens are burned
    event Burn(address indexed from, uint256 amount);

    // Function to mint new tokens
    // Takes an address and a value as parameters
    function mint(address to, uint256 amount) public {
        // Increase the total supply by the amount of tokens minted
        totalSupply += amount;
        // Increase the balance of the specified address by the amount of tokens minted
        balances[to] += amount;
        // Emit the Mint event
        emit Mint(to, amount);
    }

    // Function to burn tokens
    // Takes an address and a value as parameters
    function burn(address from, uint256 amount) public {
        // Check if the balance of the specified address is greater than or equal to the amount to be burned
        require(balances[from] >= amount, "Insufficient balance to burn");

        // Decrease the total supply by the amount of tokens burned
        totalSupply -= amount;
        // Decrease the balance of the specified address by the amount of tokens burned
        balances[from] -= amount;
        // Emit the Burn event
        emit Burn(from, amount);
    }
}
