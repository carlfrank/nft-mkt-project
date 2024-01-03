const Migrations = artifacts.require("Migrations");

module.exports = function (deployers) {
    deployers.deploy(Migrations);
}
