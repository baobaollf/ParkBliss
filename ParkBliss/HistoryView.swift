//
//  HistoryView.swift
//  ParkBliss
//
//  Created by Crayon on 4/13/22.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack{
            Text("16:00 @ Hyde Park").padding()
            Text("12:00 @ UIC").padding()
            Text("11:00 @ LOOP").padding()
        
        }
        .navigationTitle("🚗 History 🚗")
    } 
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
