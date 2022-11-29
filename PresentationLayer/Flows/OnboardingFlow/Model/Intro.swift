import Foundation
import SwiftUI

struct Intro: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
}

var intros: [Intro] = [
    .init(imageName: "man1", title: "Relax"),
    .init(imageName: "man1", title: "Care"),
    .init(imageName: "man1", title: "Mood Dairy")
]
