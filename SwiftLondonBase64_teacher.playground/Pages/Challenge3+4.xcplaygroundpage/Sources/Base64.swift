import Foundation

public typealias Base64String = String
public extension String {
    public func encryptBase64(key:String) -> Base64String {
        // we don"t care about the key length, if it"s longer than string we ignore additional characters
        let strLength = characters.count
        
        // create buffers of the same length as longest string
        var buff1 = [UInt8](count:strLength, repeatedValue:0)
        var buff2 = [UInt8](count:strLength, repeatedValue:0)
        
        // place the bytes from each string into their respective buffers
        dataUsingEncoding(NSUTF8StringEncoding)?.getBytes(&buff1, length: strLength)
        key.dataUsingEncoding(NSUTF8StringEncoding)?.getBytes(&buff2, length: key.characters.count)
        
        // zip together the two buffers to make XOR easier
        let z = zip(buff1, buff2)
        
        // use map to perform the XOR
        let xor = z.map{$0 ^ $1}
        
        // create Base64 string from bytes and return it
        let b64str = NSData(bytes: xor, length: xor.count).base64EncodedStringWithOptions([])
        return b64str
    }
    
}

public extension Base64String {
    public func decryptBase64(key:String) -> String? {
        if let encryptedData = NSData(base64EncodedString: self, options: []) {
            // we don't care about the key length, if it's longer than string we ignore additional characters/bytes
            let strLength = encryptedData.length
            
            // create buffers of the same length as longest string
            var buff1 = [UInt8](count:strLength, repeatedValue:0)
            var buff2 = [UInt8](count:strLength, repeatedValue:0)
            
            // fill the buffers
            encryptedData.getBytes(&buff1, length: strLength)
            key.dataUsingEncoding(NSUTF8StringEncoding)?.getBytes(&buff2, length: strLength)
            
            // zip together the two buffers to make XOR easier
            let z = zip(buff1, buff2)
            
            // use map to perform the XOR
            let xor = z.map{$0 ^ $1}
            
            let unencryptedData = NSData(bytes: xor, length: xor.count)
            return String(data: unencryptedData, encoding: NSUTF8StringEncoding) // decoded
        }
        return nil
    }
}

// Teacher Notes: both buffers need to be the length of the string and NOT the key because otherwise, when we come to zip, the shortest array dictates the length of the Zip2Sequence and so the later characters/bytes would be lost. To achieve this we pad with zero values since they will not alter a byte value when we apply XOR and it keeps everything neat.
// In the XORing of an image (see Extra Mile Challenge on next page) we learn why padding might not be efficient and that the XORing against zero is unnecessary BUT here as part of the learning process it's OK even if it's not optimal because the result is the same.