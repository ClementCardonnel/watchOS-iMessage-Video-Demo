//
//  ContentView.swift
//  MessageH265 Watch App
//
//  Created by Clément Cardonnel on 10/11/2022.
//

import SwiftUI

struct ShareableVid: Transferable {
    let url: URL
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .mpeg4Movie) { transferable in
            SentTransferredFile(transferable.url)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            let h265URL = Bundle.main.url(forResource: "testH265", withExtension: "mp4")!
            let h265Shareable = ShareableVid(url: h265URL)
            ShareLink(item: h265Shareable, preview: SharePreview(Text("H265"), image: h265Shareable)) {
                Text("Share H265")
            }
            
            let h264URL = Bundle.main.url(forResource: "testH264", withExtension: "mp4")!
            let h264Shareable = ShareableVid(url: h264URL)
            ShareLink(item: h264Shareable, preview: SharePreview(Text("H264"), image: h264Shareable)) {
                Text("Share H264")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
