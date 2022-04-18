//
//  ParkingSpot.swift
//  ParkBliss
//
//  Created by baobaollf on 3/28/22.
//

import SwiftUI



struct ParkingSpot: View {

    var imageName: String;
    var body: some View {
        VStack{
            Text("2nd Floor Row B #13")
                .font(.largeTitle)
            Image(imageName)
                .resizable()
                .scaledToFit()
            HStack{
                NavigationLink(destination: ContentView()){
                    Text("Home")
                }.buttonStyle(GrowingButton())
                    .padding()


                NavigationLink(destination: ShareView()){
                    Text("Share")
                }.buttonStyle(GrowingButton())
                    .padding()
            }
        }
    }
}



struct ParkingSpot_Previews: PreviewProvider {
    static var previews: some View {
        ParkingSpot(imageName: "spot1")
    }
}
