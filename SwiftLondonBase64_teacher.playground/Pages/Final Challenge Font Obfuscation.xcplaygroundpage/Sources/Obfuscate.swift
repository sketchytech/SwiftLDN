import Foundation




public func obfuscateFontIDPF(data:NSData, key:String) -> NSData {
    // convert string to data
    // now do obfuscation
    let source = data
    var destination = [UInt8]()
    guard var keyData = sha1data(key) else {
        fatalError("key cannot be transformed into array")
    }
    var arr = [UInt8](count: source.length, repeatedValue: 0)
    source.getBytes(&arr, length:source.length)
    arr.count
    var outer = 0
    while outer < 52 && arr.isEmpty == false {
        var inner = 0
        while inner < 20 && arr.isEmpty == false {
            let byte = arr.removeAtIndex(0)      //Assumes read advances file position

            let sourceByte = byte

            let keyByte = keyData[inner]
          
            let obfuscatedByte = (sourceByte ^ keyByte)
          
            destination.append(obfuscatedByte)
            inner += 1
        }
        
        outer += 1
    }
    
    destination.appendContentsOf(arr)
    let newData = NSData(bytes: &destination, length: destination.count*sizeof(UInt8))
    arr.removeAll(keepCapacity: false)
    return newData
}

