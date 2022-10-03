//
//  MainView.swift
//  PayrocExample
//
//  Created by Lei Zhang on 01/10/2022.
//

import SwiftUI
import PaymentLib

struct MainView: View {
    var body: some View {
        Button {
            print("Clicked Me")
            
            do {
                let card = try PaymentLib.getRandomCard()
                let type = card.getTransactionType()
                print("Transaction tyep \(String(describing: type))")
            } catch let error {
                print("Error found \(error)")
            }
            
        } label: {
            Text("Press Me").padding(20)
        } .contentShape(Rectangle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
