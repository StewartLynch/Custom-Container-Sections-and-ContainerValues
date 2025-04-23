//
//----------------------------------------------
// Original project: CustomContainer-Demo2
// by  Stewart Lynch on 2025-04-23
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

struct CustomListContainer<Content: View> : View {
    @ViewBuilder var content: Content
    var body: some View {
        List {
            Group(sections: content) { sections in
                ForEach(sections) { section in
                    section.header
                        .font(.title)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.teal.gradient)
                        .foregroundStyle(.white)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(section.content) { view in
                                view
                                    .padding(.horizontal)
                                    .foregroundStyle(.white)
                                    .background(.green, in: RoundedRectangle(cornerRadius: 7))
                            }
                        }
                    }
                    .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
                    section.footer
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
