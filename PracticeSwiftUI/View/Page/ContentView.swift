//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by yoshiki-t on 2019/10/03.
//  Copyright © 2019 yoshiki-t. All rights reserved.
//

import SwiftUI

struct ContentView<Content: View>: View {
    @State var foregroundView: () -> Content

    var body: some View {
        ZStack {
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

                        NavigationLink(destination: TextFieldExample()) {
                            Text("TextFieldExample")
                        }

                        NavigationLink(destination: LoadingHudView(foregroundView: $foregroundView)) {
                            Text("TextFieldExample")
                        }
                    }
                }.navigationBarTitle(Text("UIサンプル"), displayMode: .inline)
            }
            Color(.black).opacity(0.6).edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(foregroundView: { EmptyView() })
    }
}
