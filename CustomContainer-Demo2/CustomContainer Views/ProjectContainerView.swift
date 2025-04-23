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

extension ContainerValues {
    @Entry var topPriority = false
}

struct ProjectContainerView<Content: View> : View {
    @Binding var selectedProject: Project
    @ViewBuilder var content: Content
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                Group(sections: content) { sections in
                    let prioritySections = sections.filter {$0.containerValues.topPriority}
                    let otherSections = sections.filter {!$0.containerValues.topPriority}
                    ForEach(prioritySections) { section in
                        section.header
                            .font(.largeTitle)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.mint.gradient)
                            .padding(.top, 5)
                            .foregroundStyle(.white)
                            .listRowSeparator(.hidden)
                            .id("top")
                        ForEach(section.content) { view in
                            view
                                .font(.title2)
                                .alignmentGuide(.listRowSeparatorLeading) { _ in
                                    0
                                }
                                .listRowSeparatorTint(.mint)
                        }
                    }
                    ForEach(otherSections) { section in
                        section.header
                            .font(.largeTitle)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.gray.gradient)
                            .padding(.top, 5)
                            .foregroundStyle(.white)
                            .listRowSeparator(.hidden)
                        ForEach(section.content) { view in
                            view
                                .alignmentGuide(.listRowSeparatorLeading) { _ in
                                    0
                                }
                                .listRowSeparatorTint(.gray)
                        }
                    }
                }
            }
            .onChange(of: selectedProject) {
                withAnimation {
                    proxy.scrollTo("top")
                }
            }
        }
        .animation(.default, value: selectedProject)
        
    }
}
