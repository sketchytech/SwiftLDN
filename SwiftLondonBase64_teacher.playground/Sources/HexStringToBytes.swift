import Foundation

extension String {
    func hexToByteArray() -> [UInt8] {
        var string = self
        var dataArray = [UInt8]()
        for _ in 0.stride(to: string.characters.count, by: 2) {
            var str = "0x\(string.characters.first!)"
            string.removeAtIndex(string.startIndex)
            str.append(string.characters.first!)
            string.removeAtIndex(string.startIndex)
            dataArray.append(UInt8(strtod(str,nil)))
        }
        return dataArray
    }
}



public func sha1data(str:String) -> [UInt8]? {
    
    return Crypto.sha1(str)?.hexToByteArray()
    
    
}