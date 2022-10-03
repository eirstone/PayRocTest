//
//  PaymentError.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

public enum PaymentError: Error {
    case card_not_found
    case payment_request_corrupt
}
