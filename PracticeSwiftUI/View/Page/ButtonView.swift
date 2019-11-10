import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack(alignment: .center) {
            SimpleLargeButton()
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

struct SimpleLargeButton: View {
    var margin: CGFloat = 16

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Button(action: {
                }, label: {
                    Text("SimpleLargeButton")
                        .frame(width: geometry.size.width - (self.margin * 2), height: nil)
                        .padding([.top, .bottom], self.margin)
                        .background(Color(.lightGray))
                })
                Spacer()
            }
        }
    }
}
