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

import Foundation

struct ToDo: Identifiable {
    let id = UUID()
    let item: String
    let project: Project
    var completed: Bool
}

enum Project: String, CaseIterable, Identifiable {
    case swiftUIApp
    case macApp
    case videoTutorial
    case websiteUpdate

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .swiftUIApp: return "SwiftUI App"
        case .macApp: return "Mac App"
        case .videoTutorial: return "Video Tutorial"
        case .websiteUpdate: return "Website Update"
        }
    }
}

extension ToDo {
    static let mockToDos: [ToDo] = [
        .init(item: "Design login screen", project: .swiftUIApp, completed: false),
        .init(item: "Implement authentication and more here", project: .swiftUIApp, completed: true),
        .init(item: "Fix layout bugs", project: .swiftUIApp, completed: false),
        .init(item: "Add onboarding flow", project: .swiftUIApp, completed: true),
        .init(item: "Create settings page", project: .swiftUIApp, completed: false),

        .init(item: "Create menubar icon", project: .macApp, completed: true),
        .init(item: "Implement window detach behavior", project: .macApp, completed: false),
        .init(item: "Support light/dark mode", project: .macApp, completed: true),
        .init(item: "Test on macOS 14", project: .macApp, completed: false),
        .init(item: "Integrate with system events", project: .macApp, completed: true),

        .init(item: "Write script outline", project: .videoTutorial, completed: true),
        .init(item: "Record voiceover", project: .videoTutorial, completed: false),
        .init(item: "Edit intro sequence", project: .videoTutorial, completed: false),
        .init(item: "Upload to YouTube", project: .videoTutorial, completed: true),
        .init(item: "Create thumbnail", project: .videoTutorial, completed: true),

        .init(item: "Update blog post", project: .websiteUpdate, completed: false),
        .init(item: "Fix mobile layout", project: .websiteUpdate, completed: true),
        .init(item: "Improve accessibility", project: .websiteUpdate, completed: false),
        .init(item: "Check broken links", project: .websiteUpdate, completed: true),
        .init(item: "Add contact form", project: .websiteUpdate, completed: false)
    ]
}



