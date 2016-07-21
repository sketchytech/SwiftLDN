import Foundation

public extension String {
    func base64EncodeUTF8() -> String? {
        return self.dataUsingEncoding(NSUTF8StringEncoding)?.base64EncodedStringWithOptions([])
    }

    func base64DecodeUTF8() -> String? {
        if let data = NSData(base64EncodedString: self, options: []) {
            return String(data: data, encoding: NSUTF8StringEncoding)
        }
        else {
            return nil
        }
    }
}

// Teacher notes: we can't just go from a string direct to Base64, first of all the string must be transformed into NSData and then the data can be encoded into a Base64 encoded string. The same is true when decoding: first we create an instance of NSData from the Base64 string and then transform the data into a UTF8-encoded string.