//: [Previous](@previous)

//: # Swift  London: Bytes for Beginners Coding Challenge 2016
/*:
 ## Challenge No. 5
 Stored in this playground is a text file "Base64Image.txt". It contains the data for an image stored as a Base64-encoded string. Transform this string into an image.
 */
import UIKit

var img:UIImage?
if let url = NSBundle.mainBundle().URLForResource("Base64Image", withExtension: "txt") {
    do {
       img = try String(contentsOfURL: url).toImage()
    }
    catch {
        print("error")
    }
    
}
/*:
 ## Challenge No. 6
 Now transform the image back into a Base64-encoded string
 */
if let image = img {
        let b64str = image.toBase64()
    
}
/*:
Hint: for transforming a UIImage into NSData use **UIImageJPEGRepresentation**
 or **UIImagePNGRepresentation**
 */

/*:
 ## Extra Mile Challenge
 Remember how we performed a basic encryption of our text using a XOR? Trying encrypt the image bytes by XORing with a key and return a Base64-encoded string
 */

if let image = img {
    let b64str = image.imageToBase64("encryption key")
    // now make sure it works
    let img = b64str?.decryptBase64toImage("encryption key")
    
}
//: [Next](@next)
