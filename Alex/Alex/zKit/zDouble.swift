//
//  zDouble.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import Foundation

extension Double {
    var abs: Double {
        return Foundation.fabs(self)
    }

    var sqrt: Double {
        return Foundation.sqrt(self)
    }

    var floor: Double {
        return Foundation.floor(self)
    }

    var ceil: Double {
        return Foundation.ceil(self)
    }

    var round: Double {
        return Foundation.round(self)
    }

    func dlamp(min: Double, _ max: Double) -> Double {
        return Swift.max(min, Swift.min(self, max))
    }

    static func random(min: Double, _ max: Double) -> Double {
        let diff = max - min
        let rand = Double(arc4random() % (UInt32(RAND_MAX) + 1))
        return ((rand / Double(RAND_MAX)) * diff) + min
    }
}
