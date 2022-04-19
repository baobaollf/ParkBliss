//
//  ParkButton.swift
//  ParkBliss
//
//  Created by baobaollf on 3/21/22.
//

import SwiftUI
import Foundation
import CoreNFC

struct Arc: Shape {
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: clockwise)
        
        path.closeSubpath()
        
        return path
    }
}


extension UIApplication {
    
    static func topMostController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
            return nil
        }
        
        var topController = rootViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return topController
    }
}

class ErrorReporting {
    static func showMessage() {
        let alertController = UIAlertController(
            title: "Scanning Not Supported",
            message: "This device doesn't support smart tag scanning. \n Use iPhone X or newer",
            preferredStyle: .alert
        );
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        UIApplication.topMostController()?.present(alertController, animated: true, completion: nil);
    }
}

class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?;
    @Published var imageName = "";
    @Published var showPage = false;
    func scan() {
        guard NFCNDEFReaderSession.readingAvailable else {
            ErrorReporting.showMessage();
            return
        }
        // Create a reader session and pass self as delegate
        session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: true);
        session?.alertMessage = "Hold your iPhone near the smart tag to record your parking spot";
        session?.begin();
    }
    
    // MARK: delegate methods
    // Implement the NDEF reader delegate protocol.
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("error " + error.localizedDescription);
        // Error handling
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Handle received messages
        for payload in messages[0].records {
            let str = String.init(data: payload.payload.advanced(by: 3), encoding: .utf8) ?? "";
            print(str)
            imageName = str;
            showPage = true;
            // ContentView.str = str;
        }
        
    }
}

struct ParkButton: View {
    @StateObject var reader = NFCReader();
    
    var body: some View {
        
        VStack {
            if (reader.imageName != "") {
                NavigationLink("", destination: ParkingSpot(imageName: reader.imageName), isActive: $reader.showPage)
            }
            
            
            if (reader.imageName != "") {
                ZStack {
                    Button(action: {
                        reader.scan();
                    }) {
                        Arc(clockwise: true)
                            .fill(.green)
                            .frame(width: 250, height: 250)
                            .offset(y: 128)
                            .onTapGesture {
                                reader.scan();
                                print("scanning");
                            }
                    }
                    Text("Park")
                        .font(.system(size: 30))
                        .offset(y: 90)
                }
                
                
                ZStack {
                    NavigationLink(destination: ParkingSpot(imageName: reader.imageName)){
                        ZStack{
                            Arc(clockwise: false)
                                .fill(.blue)
                                .frame(width: 250, height: 250)
                                .offset(y: -128)
                            Text("Current Parking")
                                .offset(y: -90)
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                        }
                    }
                }
                
            } else {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 300, height: 250)
                    
                        .onTapGesture {
                            reader.scan();
                            print("scanning");
                        }
                    Text("Park")
                        .font(.system(size: 30))
                }
            }
            
            
        }
    }
}



struct ParkButton_Previews: PreviewProvider {
    static var previews: some View {
        ParkButton();
    }
}
