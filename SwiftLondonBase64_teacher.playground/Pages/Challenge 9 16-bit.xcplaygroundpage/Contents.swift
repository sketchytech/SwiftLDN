//: [Previous](@previous)

//: # Swift  London: Bytes for Beginners Coding Challenge 2016
import Foundation


/*:
 ## Challenge 9
 We now have a hexadecimal string in which the bytes represent a UTF-16 text string.
 
 */
var hexStr16bit = "FEFF_0057_0065_006C_006C_0020_0064_006F_006E_0065_002C_0020_0067_006F_006F_0064_0020_0074_006F_0020_0073_0065_0065_0020_0079_006F_0075_0020_0068_0065_0072_0065_002E_0020_0059_006F_0075_0020_0072_0065_0061_006C_006C_0079_0020_0061_0072_0065_0020_0065_0078_0063_0065_006C_006C_0069_006E_0067_0021_0021_0021_0020_D83C_DF89_D83C_DF7E"

hexStr16bit.hexStringToUTF16()

/*:
 ## Extra Mile Challenge
 Encode your own string into a hexadecimal byte string
*/
let str = "A message encoded in 16-bit hexadecimal."

str.byteRepresentationUInt16(.Hexadecimal)?.joinWithSeparator("_")

/*:
 ## Hint
 UTF-16 means that we are working with 16 bit numbers and in this instance the string represents an array of [UInt16]
 */

//: [Next](@next)
