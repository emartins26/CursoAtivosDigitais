// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title Duplicata
 * @dev Operacoes de uma duplicata
 * @author Elisa Martins
 */
 contract Duplicata is Titulo, Owner {

    string _emissor;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _prazoPagamento;
    uint256 immutable _vencimento;
    string  _numeroFatura;
    string _Nomesacado;



    constructor() {
        _emissor = "Emissor Comercial LTDA";
        _dataEmissao = block.timestamp;
        _numeroFatura = "77777";       
        _valor = 100;
        _decimais = 2;
        _vencimento = _dataEmissao + 90 days;
        _Nomesacado = "Sacado LTDA";
        _prazoPagamento = _dataEmissao + 90 days;
        emit NovoPrazoPagamento(_dataEmissao, _prazoPagamento);
    }

    /**
     * @dev Retorna o valor duplicata.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory) {
        return _emissor;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }

    /**
     * @dev Retorna o Número da Fatura.
     */
    function numeroFatura() external view returns (string memory) {
        return _numeroFatura;
    }

    
    /**
     * @dev Retorna o nome do Sacado.
     */
    function Nomesacado() external view returns (string memory) {
        return _Nomesacado;
    }

    /**
    * @dev muda o prazo de pagamento
    * @notice dependendo da situacao economica o prazo de pagamento pode mudar
    * @param prazoPagamento_ novo prazo de pagamentos a ser adicionado. Em segundos
    */
    function mudaDataPagamento(uint256 prazoPagamento_) external onlyOwner returns (uint256) {
        emit NovoPrazoPagamento(_prazoPagamento, _prazoPagamento + prazoPagamento_);
        _prazoPagamento = _prazoPagamento + prazoPagamento_;
        return _prazoPagamento;
    }

 }
