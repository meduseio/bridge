//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

/*
*  Meduse Bridge prototype.
*
*/
contract Bridge is Ownable{

  IERC20 bridgeToken;
  uint networkid;
  uint nonce;

  event BridgeCoin(uint _networkid, address _target, uint256 _amount, uint _nonce);
  event BridgeTransfer(address _target, uint256 _amount, uint _nonce);
  event BridgeComplete(uint _nonce);

  constructor(IERC20 _bridgeToken, uint _networkid){
    bridgeToken = _bridgeToken;
    networkid = _networkid
  }

  function allowance(uint256 _amount){
    require(bridgeToken.balanceOf(msg.sender) >= _amount, "No enough balance");
    bridgeToken.approve(address(this), _amount);
  }

  function bridgeCoin(uint _networkid, address _target, uint256 _amount) public returns (uint256)
  {
    require(bridgeToken.balanceOf(msg.sender) >= _amount, "Not enough balance");
    require(bridgeToken.allowance(msg.sender, address(this) >= _amount, "Increase Allowance");
    require(networkid != _networkid, "Same network");
    bridgeToken.transferFrom(msg.sender, address(this), _amount);
    nonce=nonce + 1;
    emit BridgeCoin(_networkid, _target, _amount, nonce);
    return nonce;
  }

  function transferCoin(uint _nonce, address _target, uint256 _amoun) public returns (bool){
    require(owner() == msg.sender, "Only Owner");
    require(bridgeToken.balanceOf(address(this)) >= _amount, "Not enough balance");
    bridgeToken.transfer(_target, _amount);
    emit BridgeTransfer(_target, _amount, nonce);
    return true;
  }

  function completeBridge(uint _nonce){
    require(owner() == msg.sender, "Only Owner");
    emit BridgeComplete(_nonce);

  }

}
