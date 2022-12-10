import Foundation
import SwiftUI

struct Intro: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
}

var intros: [Intro] = [
    .init(imageName: "man2", title: "Keep Control"),
    .init(imageName: "woman2", title: "Time Management"),
    .init(imageName: "woman3", title: "Follow your plans")
]
