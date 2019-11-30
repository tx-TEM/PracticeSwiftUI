//
//  RootView.swift
//  PracticeSwiftUI
//
//  Created by yoshiki-t on 2019/11/30.
//  Copyright © 2019 yoshiki-t. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView()) {
                Text("Content")
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
