const Token = artifacts.require("Token");

contract("Token", (accounts) => {
  before(async () => {
    this.token = await Token.deployed();
    0.3;
  });

  it("deploys successfully", async () => {
    const address = await this.token.address;
    assert.notEqual(address, 0x0);
    assert.notEqual(address, "");
    assert.notEqual(address, null);
    assert.notEqual(address, undefined);
  });

  it("Test", async () => {
    const address = await this.token.balanceOf(
      "0x2c23eCB19c3dd7E50525678cb17BD32E92ADdb20"
    );
    console.log(address);
  });
});
