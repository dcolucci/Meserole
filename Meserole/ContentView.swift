// progress: https://www.hackingwithswift.com/books/ios-swiftui/views-and-modifiers-wrap-up
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
            .foregroundColor(.blue)
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

// create a grid
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("A cool title")
                .titleStyle()
            GridStack(rows: 4, columns: 4) { row, col in
                Button(action: {
                    print(type(of: self.body))
                }) {
                    Image(systemName: "\(row * 4 + col).circle")
                }
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
