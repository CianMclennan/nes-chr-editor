//
//  Config.swift
//  NES CHR Editor
//
//  Created by Tom Salvo on 9/18/16.
//  Copyright © 2016 Tom Salvo. All rights reserved.
//

import Foundation

fileprivate let kBitsPerPixel = 2

public let kCHRWidthInPixels:Int = 8
public let kCHRHeightInPixels:Int = 8

public let kMaxCHRGridHistory:UInt = 64

public let kMaxPaletteSets:UInt = 64

public let kCHRSizeInBytes = kCHRWidthInPixels * kCHRHeightInPixels * kBitsPerPixel / 8

public enum SupportedFileSize:UInt {
    
    case Size8KB = 8, Size16KB = 16, Size32KB = 32, Size64KB = 64, Size128KB = 128, Size256KB = 256, Size512KB = 512, Size1024KB = 1024
    
    var friendlyName:String { return "\(self.rawValue) KB" }
    
    var fileSizeInBytes:UInt { return self.rawValue * 1024 }
    
    var numCHRsInFile:UInt { return self.fileSizeInBytes / UInt(kCHRSizeInBytes) }
    
    var numCHRCols:UInt { return 16 }
    
    var numCHRRows:UInt { return self.numCHRsInFile / self.numCHRCols }
    
    var sizeinPixels:(width: UInt, height:UInt) { return (UInt(kCHRWidthInPixels) * self.numCHRCols, UInt(kCHRHeightInPixels) * self.numCHRRows) }
    
    static let allValues:[SupportedFileSize] = [.Size8KB, .Size16KB, .Size32KB, .Size64KB]
}
