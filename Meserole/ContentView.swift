// progress: https://www.hackingwithswift.com/books/ios-swiftui/why-does-swiftui-use-some-view-for-its-view-type
//  ContentView.swift
//  Meserole
//
//  Created by Colucci, David on 4/14/20.
//  Copyright © 2020 Colucci, David. All rights reserved.
//

import SwiftUI

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

struct ContentView: View {
    var body: some View {
        VStack {
            CapsuleView(text: "whats up")
            CapsuleView(text: "Whats good")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
