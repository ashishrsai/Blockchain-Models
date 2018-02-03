import Cocoa
//: Playground - noun: a place where people can play
// Building a outline for the actul blockchain server

//The blockchain is going to contain a class Trasaction which we will use in each block (Each block will contain multiple or single transction)
class transaction : Codable{
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
    var transactionInBlock :[transaction] = [transaction]()
    //initilaisation of the class
    init() {
        self.nonce = 0
    }
    
    // we use 4 main values to calculate hash - 1. Index , 2. Hash of previous block , 3. Nonce , 4. Our transction (This has to be in String) For our blockchain we take all these valeus in String
    var hashingValue :String{
        let transactionInJSON = try! JSONEncoder().encode(self.transactionInBlock)
        let transactionInString = String(data: transactionInJSON,encoding: .utf8)
        
        return String(self.index) + self.lastHash + String(self.nonce) + transactionInString!
    }
    
    func appendTransaction(transactionInBlock :transaction){
        self.transactionInBlock.append(transactionInBlock)
    }
    
}

//this class is the actual blockchain (This will consist of multiple blocks)
class blockChain {
    //blockInBlockChain is an array of object of class blockchainBlock (blockchain will have a number of blocks thus an array)
    var blockInBlockChain :[blockchainBlock] = [blockchainBlock]()
    
}


//Testing
let testBlock = blockchainBlock()
let transaction1 = transaction(amount: 100,to: "0xaqwsdjabs",from: "0sachakgldqw")
testBlock.appendTransaction(transactionInBlock: transaction1)
testBlock.hashingValue
print(testBlock.hashingValue)


