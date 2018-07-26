pragma solidity ^0.4.23;

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/// @title ERC777 ReferenceToken Contract
/// @author Jordi Baylina, Jacques Dafflon
/// @dev This token contract's goal is to give an example implementation
///  of ERC777 with ERC20 compatible.
///  This contract does not define any standard, but can be taken as a reference
///  implementation in case of any ambiguity into the standard

interface EIP777 {
    function name() external view returns (string);
    function symbol() external view returns (string);
    function granularity() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);

    function send(address to, uint256 value) external;
    function send(address to, uint256 value, bytes userData) external;

    function authorizeOperator(address operator) external;
    function revokeOperator(address operator) external;
    function isOperatorFor(address operator, address tokenHolder) external view returns (bool);
    function operatorSend(address from, address to, uint256 value, bytes userData, bytes operatorData) external;

    event Sent(address indexed from, address indexed to, uint256 value, address indexed operator, bytes userData, bytes operatorData);
    event Minted(address indexed to, uint256 amount, address indexed operator, bytes operatorData);
    event Burnt(address indexed from, uint256 value);
    event AuthorizedOperator(address indexed operator, address indexed tokenHolder);
    event RevokedOperator(address indexed operator, address indexed tokenHolder);
}