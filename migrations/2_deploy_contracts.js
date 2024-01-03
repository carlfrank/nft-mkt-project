onst NFT = artifacts.require("NFT");
const Marketplace = artifacts.require("Marketplace");

module.exports = async function (deployer) {
try {
    await deployer.deploy(Marketplace);
    const marketplace = await Marketplace.deployed()
    console.log("Marketplace contract successfully deployed", marketplace.address)

    await deployer.deploy(NFT, marketplace.address);
    const nft = await NFT.deployed()
    console.log("NFT contract successfully deployed", nft.address)
} catch (e) {
    console.error(e)
}
};