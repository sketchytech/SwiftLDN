//: [Previous](@previous)

//: # Swift  London: Bytes for Beginners Coding Challenge 2016
import Foundation

/*:
 If you've got this far in the session then using the following pseudo code write Swift code for de-obfuscating a font contained in this playground that was obfuscated using Adobe InDesign:
 ````
 set source to font file
 set destination to obfuscated file
 set keyData to key for font
 set outer to 0
 while outer < 52 and not (source at EOF)
 set inner to 0
 while inner < 20 and not (source at EOF)
 read 1 byte from source     //Assumes read advances file position
 set sourceByte to result of read
 set keyByte to byte inner of keyData
 set obfuscatedByte to (sourceByte XOR keyByte)
 write obfuscatedByte to destination
 increment inner
 end while
 increment outer
 end while
 if not (source at EOF) then
 read source to EOF
 write result of read to destination
 end if
 ````
 See http://www.idpf.org/epub/20/spec/FontManglingSpec.html
 */
// IDPF font obfuscation

let key = "urn:uuid:C3998F81-7F72-442F-BA51-10BDE4893E59"
let keyData = sha1data(key) // note that keyData should be a sha1 hash of the key 

if let url = NSBundle.mainBundle().URLForResource("Lobster-Mangled", withExtension: "ttf"),
    source = NSData(contentsOfURL: url) {
    // de-obfuscate font using IDPF approach
    let obFont:NSData = obfuscateFontIDPF(source,key: key)
    do {
       try FileSave.saveData(obFont, directory: .DocumentDirectory, path: "Lobster-Regular.ttf", subdirectory: nil)
    }
    // we can locate document directory here
    FileDirectory.applicationDirectory(.DocumentDirectory)
}

/*:
 Hint: the keyData is a SHA1 encoded set of bytes. You can generate these bytes using the following function:
 */

sha1data(key)
/*:
 Also included is an easy way to save and locate the font data you create:
 ````
 do {
 try FileSave.saveData(obFont, directory: .DocumentDirectory, path: "Lobster-Regular.ttf", subdirectory: nil)
 }
 // we can locate document directory here
 FileDirectory.applicationDirectory(.DocumentDirectory)
 ````
 */
//: [Next](@next)
