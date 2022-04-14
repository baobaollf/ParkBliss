//
//  ShareView.swift
//  ParkBliss
//
//  Created by Crayon on 4/14/22.
//

import SwiftUI

class successfullyMessage {
    static func showMessage(number: String) {
        let alertController = UIAlertController(
            title: "Successfully shared",
            message: "Your location is successfully shared to",
            preferredStyle: .alert
        );
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        UIApplication.topMostController()?.present(alertController, animated: true, completion: nil);
    }
}

struct ShareView: View {
    @State private var username: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    @ObservedObject var reader = NFCReader();


    

    var body: some View {
        VStack{
            
            Text("Sharing your parking location to :")
            TextField(
                    "phone number",
                    text: $username
            )
            .padding(.leading, 60.0)
            .frame(width: 210
                   , height: 35.0)
            .focused($emailFieldIsFocused)
            .onSubmit {
                successfullyMessage.showMessage(number: username);
//                validate(name: username)
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            
//            Button("Send") {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//            }.padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
            
            if (reader.imageName != "") {
                ParkingSpot(imageName: reader.imageName)
            }
            

        
        }
        .navigationTitle("Share")
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
