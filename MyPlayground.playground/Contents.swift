//: Playground - noun: a place where people can play
// Building a outline for the actul blockchain server

import Cocoa

//The blockchain is going to contain a class Trasaction which we will use in each block (Each block will contain multiple or single transction)
class transaction {
    //amount: this will denote the value of trasaction (this field can potentially be used for other applications as well)
    var amount :Double
    //to: will contain the address of the reciver , this will be the public key of the reciver
    var to :String
    //from: this will be the public key of the sender
    var from :String
    
    //initilaisation of the class
    init(amount :Double, to :String, from :String) {
        self.amount = amount
        self.to = to
        self.from = from
    }
    
}

// this class is a block in a blockchain. Our blockchain is going to contain a number of blocks
class blockchainBlock {
    //lasthash: this field is one of the most crucial field in the block, by using the previous hash we ensure that our blockchain is consistant (This is essentially a hash pointer )
    var lastHash :String = ""
    //index: we use index in order to identify the block number (The index 0 is our gensis block)
    var index :Int = 0
    //hash: we store the hash of our current block in this varibale
    var hash :String = "" //have to wirte the hash function to get this value
    //nonce: this is a value that starts with 0 (may change depending on the application) and is incresed gradually. (Used in Proof of Work)
    var nonce :Int
    //trasnctionInBlock: this is am array of tranaction in our block class (each block can contain multiple transction)
    var trasactionInBlock :[transaction] = [transaction]()
    
    //initilaisation of the class
    init() {
        self.nonce = 0
    }
    
}

//this class is the actual blockchain (This will consist of multiple blocks)
class blockChain {
    //blockInBlockChain is an array of object of class blockchainBlock (blockchain will have a number of blocks thus an array)
    var blockInBlockChain :[blockchainBlock] = [blockchainBlock]()
    
}


