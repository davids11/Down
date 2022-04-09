//
//  Strikethrough.swift
//  Down
//
//  Created by David's MBP16 on 08.04.22.
//  Copyright © 2022 Down. All rights reserved.
//

import Foundation
import libcmark

public class Strikethrough: BaseNode {}

// MARK: - Debug

extension Strikethrough: CustomDebugStringConvertible {

    public var debugDescription: String {
        return "Strikethrough"
    }

}
