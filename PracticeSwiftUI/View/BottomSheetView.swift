import SwiftUI

struct BottomSheetView: View {
    @State var show = false

    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                VStack(spacing: 0) {
                    Color.white

                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }

                    }, label: {
                        Text("Show BottomSheet")
                            .foregroundColor(Color.white)
                            .frame(width: geometry.size.width, height: 30)
                            .background(Color.blue)
                    })
                }

                BottomSheet(isActive: self.show, dissmissAction: { self.show.toggle() }) {
                    VStack(alignment: .center, spacing: 0) {
                        Button(action: {
                            self.show.toggle()

                        }, label: {
                            Text("Close BottomSheet")
                                .foregroundColor(Color.white)
                                .padding(.vertical, 16)
                                .frame(width: geometry.size.width - 32, height: 50)
                                .background(Color.red)
                        })
                    }
                    .frame(width: geometry.size.width,height: 300)
                    .background(Color.white)
                }
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}

struct BottomSheet<Content:View> : View {
    private var contentHeight: CGFloat = 0

    var isActive = false
    var dissmissAction: () -> ()
    let content: () -> Content

    init(isActive: Bool,
         dissmissAction: @escaping () -> (),
         @ViewBuilder content: @escaping () -> Content) {

        self.isActive = isActive
        self.dissmissAction = dissmissAction
        self.content = content
    }

    var body: some View {
        VStack(spacing: 0) {
            if isActive {
                Color(.black).opacity(0.6)
                    .onTapGesture {
                        self.dissmissAction()
                    }
                    .transition(.move(edge: .bottom))

                self.content()
                    .transition(.move(edge: .bottom))
            }
        }

    }
}
