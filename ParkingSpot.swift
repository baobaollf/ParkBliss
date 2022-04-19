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
                
                Button(action: {share(address: "1200 W Harrison St, Chicago, IL 60607")}) {
                    Text("Share").padding()
                    
                }
                
                
            }
            Spacer()
        }
    }
    func share(address: String){
        let items = [address]
    //        guard let urlShare = URL (string:"https://developer.apple.com/xcode/swiftui/") else {
    //            return
    //        }
        let activityVC = UIActivityViewController (activityItems: items, applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC,animated: true,completion: nil)}
}



struct ParkingSpot_Previews: PreviewProvider {
    static var previews: some View {
        ParkingSpot(imageName: "spot2")
    }
}
