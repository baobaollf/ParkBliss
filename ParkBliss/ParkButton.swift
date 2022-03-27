//
//  ParkButton.swift
//  ParkBliss
//
//  Created by baobaollf on 3/21/22.
//

import SwiftUI
import Foundation
import CoreNFC

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
            message: "This device doesn't support tag scanning.",
            preferredStyle: .alert
        );
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        UIApplication.topMostController()?.present(alertController, animated: true, completion: nil);
    }
}

class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?;
    func scan() {
        guard NFCNDEFReaderSession.readingAvailable else {
            ErrorReporting.showMessage();
            return
        }
        
        // Create a reader session and pass self as delegate
        session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false);
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
        print(messages);
    }
}

struct ParkButton: View {
    @ObservedObject var reader = NFCReader();
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.green)
                .frame(width: 230, height: 230)
                .onTapGesture {
                    reader.scan();
                    print("scanning");
                }
            
            Text("Park")
                .font(.system(size: 30))
        }
    }
}



struct ParkButton_Previews: PreviewProvider {
    static var previews: some View {
        ParkButton();
    }
}
