const hre = require("hardhat");

const main = async() =>{
    const Test = await hre.ethers.getContractFactory("Test");
    const test = await Test.deploy("Hello, Hardhat!");
    await test.deployed();

    console.log("Test deployed to:", test.address);

    await test.regist('av','un','do','ad');
    const [owner] = await hre.ethers.getSigners();
    console.log(await test.getRecord(owner.address));

    await test.setDomain('123456');
    console.log(await test.getRecord(owner.address));
}

main()
    .then(()=>{
        console.log('Success.');
        process.exit(0);
    })
    .catch((err)=>{
        console.log('Error.'+err);
        process.exit(1);
    })