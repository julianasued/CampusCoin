// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CampusCoin is ERC20, ERC20Burnable, Ownable {
    // mapping exigido pelo item 1: controle de blacklist
    mapping(address => bool) public blacklist;

    event Blacklisted(address indexed conta, bool status);

    // constructor exigido pelo item 1: define supply inicial
    constructor(uint256 supplyInicial)
        ERC20("CampusCoin", "CAMP")
        Ownable(msg.sender)
    {
        _mint(msg.sender, supplyInicial * 10 ** decimals());
    }

    // FUNCIONALIDADE EXTRA 1: Mint (só o dono cria moedas novas)
    function mint(address para, uint256 quantidade) public onlyOwner {
        require(para != address(0), "Endereco invalido");
        _mint(para, quantidade * 10 ** decimals());
    }

    // FUNCIONALIDADE EXTRA 2: Blacklist (usa mapping + require)
    function definirBlacklist(address conta, bool status) public onlyOwner {
        require(conta != address(0), "Endereco invalido");
        blacklist[conta] = status;
        emit Blacklisted(conta, status);
    }

    // Hook central da OpenZeppelin v5: bloqueia transferências de/para blacklist
    function _update(address de, address para, uint256 valor) internal override {
        require(!blacklist[de], "Remetente bloqueado");
        require(!blacklist[para], "Destinatario bloqueado");
        super._update(de, para, valor);
    }
    // Burn vem pronto do ERC20Burnable (funcionalidade extra 3)
}
