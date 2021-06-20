const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");

module.exports = function(deployer) {

  if (network = 'main') {
  erc20_address = "0x140dc7d0fb751883b2c413a5dea65200b661db76"
} else if (network == 'bsc') {
  erc20_address = "0xa281A8E1EA39E03A92Ae43d2e90897aAE35401f1";
} else if (network == 'ropsten') {
  erc20_address = "0xe43fde44837e852a1072aced942658ce9cc49b32";
} else {
  await deployer.deploy(TestCoin);
  const testcoin = await TestCoin.deployed();
  erc20_address = testcoin.address;
}

};
