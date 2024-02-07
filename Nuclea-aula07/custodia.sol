// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/** Contrato de Custodia: 0x5F8f3B2B596dbF7F931ab8a3EBd665cc5D193047 */

/**
 * @title Custodia
 * @dev Armazena e controla a custodia de varios titulos do owner
 * @author Jeff Prestes
 */
 contract Custodia is Owner {

  address[] private titulos;

  /**
   * @dev Adiciona um titulo a custodia
   * @param titulo endereco do titulo a ser adicionado
   */
  function adicionaTitulo(address titulo) external onlyOwner {
    titulos.push(titulo);
  }

  /**
   * @dev Retorna a quantidade de titulos na custodia
   */
  function quantidadeTitulos() external view returns (uint256) {
    return titulos.length;
  }

  /**
   * @dev Retorna o endereco de um titulo na custodia
   * @param index posicao do titulo na custodia
   */
  function enderecoTitulo(uint256 index) public view returns (address) {
    return titulos[index];
  }

  /**
   * @dev Retorna dados de um titulo na custodia
   * @param index posicao do titulo na custodia
   * @return valorNominal, nomeEmissor, dataEmissao
   */
  function detalheTitulo(uint256 index) external view returns (uint256, string memory, uint256) {
    Titulo titulo = Titulo(enderecoTitulo(index));
    return (titulo.valorNominal(), titulo.nomeEmissor(), titulo.dataEmissao());
  }
 }
