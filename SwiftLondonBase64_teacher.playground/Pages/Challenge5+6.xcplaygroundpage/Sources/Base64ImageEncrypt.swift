import UIKit



public extension UIImage {
    public func imageToBase64(key:String) -> String? {
        guard let data = UIImageJPEGRepresentation(self, 1.0) else {
            return nil
        }
        var buff1 = [UInt8](count:data.length, repeatedValue:0)
        var buff2 = [UInt8](count:key.characters.count, repeatedValue:0)
        data.getBytes(&buff1, length: data.length)
        key.dataUsingEncoding(NSUTF8StringEncoding)?.getBytes(&buff2, length: key.characters.count)
        
        // zip together the two buffers to make XOR easier
        let z = zip(buff1, buff2)
        
        // use map to perform the XOR
        var xor = z.map{$0 ^ $1}
        // only as may bytes as contained in the string are encrypted
        xor.appendContentsOf(buff1.suffixFrom(buff2.count))
        
        // create Base64 string from bytes and return it
        let b64str = NSData(bytes: xor, length: xor.count).base64EncodedStringWithOptions([])
        return b64str
        
        
    }
    
}

public extension Base64String {
    public func decryptBase64toImage(key:String) -> UIImage? {
        if let encryptedData = NSData(base64EncodedString: self, options: []) {
            // we don"t care about the key length, if it's longer than string we ignore additional characters/bytes
            let strLength = encryptedData.length
            
            
            // create buffers of the same length as longest string
            var buff1 = [UInt8](count:strLength, repeatedValue:0)
            var buff2 = [UInt8](count:key.characters.count, repeatedValue:0)
            
            // fill the buffers
            encryptedData.getBytes(&buff1, length: strLength)
            key.dataUsingEncoding(NSUTF8StringEncoding)?.getBytes(&buff2, length: key.characters.count)
            
            // zip together the two buffers to make XOR easier
            let z = zip(buff1, buff2)
            
            // use map to perform the XOR
            var xor = z.map{$0 ^ $1}
            xor.appendContentsOf(buff1.suffixFrom(buff2.count))
            let unencryptedData = NSData(bytes: xor, length: xor.count)
            print(unencryptedData.length)
            return UIImage(data: unencryptedData) // decoded
        }
        return nil
    }
}


// Teacher notes: because an image is many bytes you don't want to waste timing XORing with all the extra 0 bytes in the key buffer. So this time we make the effort to simply append the remaining bytes after the XOR takes place.  