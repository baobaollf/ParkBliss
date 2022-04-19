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
            Spacer()
            if (imageName == "spot1") {
                Text("Poetry Garage").font(.largeTitle)
                Text("2nd Floor Row B #13")
                    .font(.largeTitle)
            } else {
                Text("UIC North Garage").font(.largeTitle)
                Text("1st Floor Row G #12")
                    .font(.largeTitle)
            }
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            Text("@ 4:41PM 4/10/2022 CST")
            Spacer()
            HStack{
                NavigationLink(destination: ShareView()){
                    Text("Share").padding()
                }.buttonStyle(GrowingButton())
                
            }
            Spacer()
        }
    }
}



struct ParkingSpot_Previews: PreviewProvider {
    static var previews: some View {
        ParkingSpot(imageName: "spot2")
    }
}
