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
            NavigationLink(destination: ParkingSpot(imageName: "spot1")){
                Text("4/16/22 9:35am Poetry Garage").padding()
            }.buttonStyle(GrowingButton())
            
            Text("4/10/22 3:30pm UIC North Garage").buttonStyle(GrowingButton()).padding()
            Text("4/09/22 7:36am UIC North Garage").buttonStyle(GrowingButton()).padding()
            Text("4/08/22 7:30am UIC South Garage").buttonStyle(GrowingButton()).padding()
            Text("4/06/22 7:31am UIC South Garage").buttonStyle(GrowingButton()).padding()
            Text("4/01/22 8:31am Poetry Garage").buttonStyle(GrowingButton()).padding()
            Text("3/28/22 9:08am Pier Park North Garage").buttonStyle(GrowingButton()).padding()
            Text("3/17/22 7:35am Museum East Garage").buttonStyle(GrowingButton()).padding()
        Spacer()
        }
        .navigationTitle("🚗 History 🚗")

    } 
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
