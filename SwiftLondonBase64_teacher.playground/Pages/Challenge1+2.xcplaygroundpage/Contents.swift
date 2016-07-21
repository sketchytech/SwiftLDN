//: # Swift  London: Bytes for Beginners Coding Challenge 2016
/*:
## Challenge No. 1
Write an extension or function to Base64 endcode a String in Swift
 */
import Foundation
let encoded = "Hello Swift!".base64EncodeUTF8()

/*:
 ## Challenge No. 2
 Write an extension or function to Base64 decode a String in Swift
 */
let decoded = encoded?.base64DecodeUTF8()

//: [Next](@next)
