//: # Swift  London: Bytes for Beginners Coding Challenge 2016
/*:
 ## Challenge No. 3
 Write a String extension or function that can decrypt a Base64 string given a key by XORing the bytes of the key and the string.
 */

let b64str = "MxgOERcLES0xBgsoZ3lscGhpLmNvLnVr"
let twitter = "@sketchyTech"

b64str.decryptBase64(twitter)

/*:
 ## Challenge No. 4
 Write a String extension or function that can encrypt an email address by XORing the bytes of a key and the string before returning a Base64 string
 */

let email = "youremail@example.com"

email.encryptBase64(twitter)
/*:
 Confirm it is working by now decrypting you encrypted string
 */

//: Hint: the key will likely be shorter than the email address. How will you solve this problem?
