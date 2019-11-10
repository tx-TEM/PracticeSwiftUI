//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by yoshiki-t on 2019/10/03.
//  Copyright © 2019 yoshiki-t. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @State var count = 1

    var body: some View {
        VStack(alignment: .center) {
            Text("Count")
                .font(.title)
                .background(Color.white)

            Text("\(count)")
                .font(.system(size: 64))
                .background(Color.white)
                .padding(16)

            Spacer()

            Button(action: {
                self.count += 1
            }, label: {
                Text("Click")
                    .font(.system(size: 32))
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .padding(16)
                    .frame(minWidth: 0, maxWidth: .infinity)
            })
            .background(Color.blue)
            .padding(16)
        }
        .background(Color.red)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
