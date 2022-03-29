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
            Image(imageName)
                .resizable()
                .scaledToFit()
            Text(imageName)
        }
    }
}

struct ParkingSpot_Previews: PreviewProvider {
    static var previews: some View {
        ParkingSpot(imageName: "")
    }
}
