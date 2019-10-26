//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by yoshiki-t on 2019/10/03.
//  Copyright © 2019 yoshiki-t. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    NavigationLink(destination: TestView()) {
                        Text("TestView")
                    }

                    NavigationLink(destination: ButtonView()) {
                        Text("ButtonExample")
                    }

                    NavigationLink(destination: CustomSheetView()) {
                        Text("CustomSheet")
                    }
                }
            }.navigationBarTitle(Text("UIサンプル"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
