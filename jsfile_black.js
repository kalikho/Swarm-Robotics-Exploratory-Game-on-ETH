miner.start();

eth.blockNumber; 

eth.coinbase=eth.accounts[0];
eth.defaultAccount=eth.accounts[0];;
personal.unlockAccount(eth.accounts[0],"a")

var mbd = [{"constant":true,"inputs":[],"name":"getWcount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"incwhite","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getBcount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"incblack","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]

var address = "0xd29bbc4895742b1f3f2bb85d866782f493493a8a" 

var mc = eth.contract(mbd).at(address)

mc.incblack()




