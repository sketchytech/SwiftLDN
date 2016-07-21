import Foundation


public enum Base: Int {
    case Binary = 2, Decimal = 10, Hexadecimal = 16
}

public extension String {
    
    public func byteRepresentationUInt16(base:Base) -> [String]? {
        if let data = self.dataUsingEncoding(NSUTF16StringEncoding) {
            var byteArray = [UInt16](count:data.length/sizeof(UInt16), repeatedValue:0)
            data.getBytes(&byteArray, length:data.length)
            return byteArray.map{
                var s = String($0, radix:base.rawValue).uppercaseString
                while s.characters.count < 4 {
                    s = "0\(s)"
                }
                return s
            }
        }
        return nil
    }
    
}

public enum Endianness {
    case Big, Little
}
public extension String {
    
    public func hexStringTo16BitArray(endianness:Endianness) -> [UInt16] {
        let digits = ["0","1","2","3","4","5","6","7","8","9","A",
                      "B","C","D","E","F"]
        var bytes = [UInt16]()
        for i in 0.stride(to: self.characters.count, by: 4) {
            if let firstDig = digits.indexOf(String(self[self.startIndex.advancedBy(i, limit:self.endIndex.advancedBy(-1))])),
                secondDig = digits.indexOf(String(self[self.startIndex.advancedBy(i+1, limit:self.endIndex.advancedBy(-1))])),
                thirdDig = digits.indexOf(String(self[self.startIndex.advancedBy(i+2, limit:self.endIndex.advancedBy(-1))])),
                fourthDig = digits.indexOf(String(self[self.startIndex.advancedBy(i+3, limit:self.endIndex.advancedBy(-1))])) {
                if endianness == .Big {
                bytes.append(UInt16(firstDig * (16 * 16 * 16) + secondDig * (16 * 16) + thirdDig * 16 + fourthDig).bigEndian)
                }
                else {
                    bytes.append(UInt16(firstDig * (16 * 16 * 16) + secondDig * (16 * 16) + thirdDig * 16 + fourthDig).littleEndian)
                }
                
            }
            
        }
        return bytes
    }

    public func hexStringToUTF16() -> String? {
        let string = self.characters.reduce(""){(S,C) in C == "_" ? S : S + String(C)}
        var bytes = string.hexStringTo16BitArray(.Little)
        
            return String(bytesNoCopy: &bytes, length: bytes.count * sizeof(UInt16), encoding: NSUTF16StringEncoding, freeWhenDone: false)
        
        
    }
    
  }


