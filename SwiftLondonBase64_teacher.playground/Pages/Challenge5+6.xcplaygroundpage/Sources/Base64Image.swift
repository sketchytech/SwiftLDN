import UIKit

public typealias Base64String = String
public extension Base64String {
    public func toImage() -> UIImage? {
        if let data = NSData(base64EncodedString: self, options: []) {
            return UIImage(data: data)
        }
        else {
            return nil
        }
        
    }
}

public extension UIImage {
    
    public func toBase64() -> Base64String? {
        guard let data = UIImageJPEGRepresentation(self, 1.0) else {
            return nil
        }
        return data.base64EncodedStringWithOptions([])
    }
    
}

// Teacher Notes: working with images is simply a case of transforming the image to data and then turning that data into a Base64 string, and reversing the process for decoding.