//
//  String+MisskeyKit.swift
//  MisskeyKit
//
//  Created by Yuiga Wada on 2019/11/03.
//  Copyright © 2019 Yuiga Wada. All rights reserved.
//

#if canImport(CryptoKit)
    import CryptoKit
#elseif canImport(CommonCrypto)
    import CommonCrypto
#else
    #warning("No crypto import.")
#endif
import Foundation

internal extension String {
    func decodeJSON<T>(_ type: T.Type) -> T? where T: Decodable {
        guard count > 0 else { return nil }
        
        do {
            return try JSONDecoder().decode(type, from: data(using: .utf8)!)
        } catch {
            print(error) // READ THIS CAREFULLY!
            return nil
        }
    }
    
    func sha256() -> String? {
        if #available(iOS 13.0, macOS 10.15, *) {
            guard let stringData = self.data(using: String.Encoding.utf8) else { return nil }
            return SHA256.hash(data: stringData).map { String(format: "%02hhx", $0) }.joined()
        }
        return nil
    }
    
    func regexMatches(pattern: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return [] }
        let nsString = self as NSString
        let results = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0 ..< result.numberOfRanges).map {
                result.range(at: $0).location != NSNotFound
                    ? nsString.substring(with: result.range(at: $0))
                    : ""
            }
        }
    }
}
