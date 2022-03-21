//
//  ParkButton.swift
//  ParkBliss
//
//  Created by baobaollf on 3/21/22.
//

import SwiftUI
import Foundation
import CoreNFC

class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?;
    func scan() {
        // Create a reader session and pass self as delegate
        session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false)
        session?.begin()
    }
    
    // MARK: delegate methods
    // Implement the NDEF reader delegate protocol.
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
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
        ParkButton()
    }
}
