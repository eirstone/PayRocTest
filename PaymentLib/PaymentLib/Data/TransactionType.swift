//
//  TransactionType.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

/// The Card's TransactionType
public enum TransactionType: String {
    case mag_stripe = "MAG_STRIPE"
    case emv        = "EMV"
}
