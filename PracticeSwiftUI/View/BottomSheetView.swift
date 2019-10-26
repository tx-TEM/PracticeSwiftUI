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

                BottomSheet(isActive: self.$show) {
                    VStack(alignment: .center, spacing: 0) {
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }

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

    @State private var draggedOffset = CGSize.zero
    @Binding var isActive: Bool
    let content: () -> Content

    var body: some View {
        ZStack {
            if isActive {
                Color(.black).opacity(0.6)
                    .onTapGesture {
                        withAnimation {
                            self.isActive = false
                        }
                }
            }

            VStack(spacing: 0) {
                if isActive {
                    Spacer()
                    contentView
                }
            }
        }
    }

    var contentView: some View {
        self.content()
            .transition(.move(edge: .bottom))
            .animation(.spring())
            .offset(y: self.draggedOffset.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.height > 0 {
                            self.draggedOffset = value.translation
                        }
                }
                .onEnded(){ value in
                    self.draggedOffset = .zero
                }
        )
    }
}
