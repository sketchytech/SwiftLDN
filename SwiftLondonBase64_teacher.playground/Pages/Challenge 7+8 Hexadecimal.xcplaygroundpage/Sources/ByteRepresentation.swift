import Foundation
import UIKit


public enum Base: Int {
    case Binary = 2, Decimal = 10, Hexadecimal = 16
}

public extension String {
    func byteRepresentation(base:Base) -> [String]? {
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            var byteArray = [UInt8](count:data.length, repeatedValue:0)
            data.getBytes(&byteArray, length:data.length)
            return byteArray.map{
                String($0, radix:base.rawValue).uppercaseString
            }
        }
        return nil
    }
    
   }

public enum Endianness {
    case Big, Little
}
public extension String {
    func hexStringToBytes() -> [UInt8] {
        let digits = ["0","1","2","3","4","5","6","7","8","9","A",
                      "B","C","D","E","F"]
        var bytes = [UInt8]()
        for i in 0.stride(to: self.characters.count, by: 2) {
            if let firstDig = digits.indexOf(String(self[self.startIndex.advancedBy(i)])),
                secondDig = digits.indexOf(String(self[self.startIndex.advancedBy(i+1)])) {
                bytes.append(UInt8(firstDig * 16 + secondDig))
            }
            
        }
        return bytes
    }
    
  
    
    func hexStringToUTF8() -> String? {
        let string = self.characters.reduce(""){(S,C) in C == "_" ? S : S + String(C)}
        let bytes = string.hexStringToBytes()
        return String(bytes: bytes, encoding: NSUTF8StringEncoding)
        
    }
    
    
        func base64toHex() -> String? {
            if let data = NSData(base64EncodedString: self, options: []) {
                var buff = [UInt8](count: data.length, repeatedValue:0)
                data.getBytes(&buff, length: buff.count)
                let str = buff.map{var str = String($0,radix:16).uppercaseString
                    while str.characters.count < 2 {
                        str = "0\(str)"
                    }
                    return str
                    }.joinWithSeparator("_")
                return str
                
            }
            return nil
        }
    
    func hexStringToImage() -> UIImage? {
        let string = self.characters.reduce(""){(S,C) in C == "_" ? S : S + String(C)}
        var bytes = string.hexStringToBytes()
        let data = NSData(bytes: &bytes, length: bytes.count)
        return UIImage(data:data)
        
    }
}


