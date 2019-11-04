//
//  TextView.swift
//  PracticeSwiftUI
//
//  Created by yoshiki-t on 2019/11/04.
//  Copyright © 2019 yoshiki-t. All rights reserved.
//

import SwiftUI

struct TextFieldExample: View {
    @State var text1 = ""
    @State var text2 = ""
    @State var secureText = ""


    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField("text field", text: $text1)
                .padding(.horizontal, 32)
                .padding(.top, 32)


            Color(UIColor.black).frame(height: 1)
                .padding(.horizontal, 32)
                .padding(.bottom, 32)

            Text(verbatim: text2)

            UIKitTextField(text: $text2, configure: {_ in })
                .padding(.horizontal, 32)

            Color(UIColor.black).frame(height: 1)
                .padding(.horizontal, 32)
                .padding(.bottom, 32)

            SecureField("secure field", text: $secureText)
                .padding(.horizontal, 32)
                .background(Color(UIColor.white))

            Color(UIColor.black).frame(height: 1)
                .padding(.horizontal, 32)

            Spacer()

        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
