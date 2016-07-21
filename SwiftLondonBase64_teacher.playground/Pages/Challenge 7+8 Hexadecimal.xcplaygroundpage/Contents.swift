//: [Previous](@previous)

//: # Swift  London: Bytes for Beginners Coding Challenge 2016
import Foundation

/*:
 ## Challenge No. 7
 Here is a string of hexadecimal bytes, it contains a message written in UTF8 string encoding. Convert the string of bytes into the message
 */
let hexStr = "57656C6C20646F6E6520666F72206D616B696E67206974207468697320666172207468726F75676820746865205377696674204C6F6E646F6E204368616C6C656E6765732E20596F7520617265206120737461722120F09F8C9F"

hexStr.hexStringToUTF8()


/*:
 ## Challenge No. 8
Think about how you would encode a message as an array demonstrating those bytes as binary numbers, hexadecimal numbers and decimal numbers
 */
let str = "A message to be converted to bytes"
str.byteRepresentation(.Binary)
str.byteRepresentation(.Hexadecimal)
str.byteRepresentation(.Decimal)
/*:
 ## Extra Mile Challenge
 Remember how we decoded and encoded an image using Base64? Now try encoding the image using a hexadecimal string representation.
 */

if let url = NSBundle.mainBundle().URLForResource("Base64Image", withExtension: "txt") {
    do {
        var img = try String(contentsOfURL: url).base64toHex()
      
    }
    catch {
        print("error")
    }
    
}


//: [Next](@next)
