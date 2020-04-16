// progress: https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers
//  ContentView.swift
//  Meserole
//
//  Created by Colucci, David on 4/14/20.
//  Copyright © 2020 Colucci, David. All rights reserved.
//

import SwiftUI

// reusable UI element for capsules
struct CapsuleView: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

// custom modifier to apply Title styles
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// wrap the custom modifier in an extension for ease-of-use
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

// a modifier that creates a new view structure
// renders a VStack to position a standardized Text
// element over the passed content
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
        }
    }
}

// wrap the Watermark modifier in an extension for ease-of-use
extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            CapsuleView(text: "whats up")
            Text("Not Doing Things (tm)")
                .titleStyle()
            Color.red
                .frame(width: 300, height: 200)
                .watermarked(with: "this is real")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
