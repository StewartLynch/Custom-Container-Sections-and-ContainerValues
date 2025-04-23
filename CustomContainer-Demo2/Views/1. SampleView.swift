//
//----------------------------------------------
// Original project: CustomContainer-Demo2
// by  Stewart Lynch on 2025-04-22
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.

import SwiftUI

struct SampleView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("First Section") {
                    Text("One")
                    Text("Two")
                }
                Section(header: Text("Second Section")) {
                    Text("Second 1")
                    Text("Second 2")
                }
                Section {
                    ForEach(1..<10) { index in
                        Text("Third \(index)")
                    }
                } header: {
                    Text("Third Section")
                }
                Section {
                    Text("Fourth 1")
                    Text("Fourth 2")
                } header: {
                    Text("Fourth Section")
                } footer: {
                    Text("Fourth Footer")
                }
            }
            .navigationTitle("Sample List")
        }
    }
}

#Preview {
    SampleView()
}



