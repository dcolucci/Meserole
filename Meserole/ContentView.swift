// progress: https://www.hackingwithswift.com/books/ios-swiftui/why-does-swiftui-use-some-view-for-its-view-type
//  ContentView.swift
//  Meserole
//
//  Created by Colucci, David on 4/14/20.
//  Copyright © 2020 Colucci, David. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var useColor = false;

    var body: some View {
        Button("Hello, World") {
            self.useColor.toggle()
        }
        .frame(maxWidth: 200, maxHeight: 200)
        .background(useColor ? Color.red : Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
