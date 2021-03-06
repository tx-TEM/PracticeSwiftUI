import SwiftUI

struct CustomSheetView: View {
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
                        Text("Show CustomSheet")
                            .foregroundColor(Color.white)
                            .frame(width: geometry.size.width, height: 30)
                            .background(Color.blue)
                    })
                }

                CustomSheet(isActive: self.$show, backgroundColor: UIColor.white) {
                    VStack(alignment: .center, spacing: 0) {
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }

                        }, label: {
                            Text("Close CustomSheet")
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

struct CustomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetView()
    }
}

struct CustomSheet<Content:View> : View {

    @State private var draggedOffset = CGSize.zero
    @Binding var isActive: Bool
    let backgroundColor: UIColor
    let content: () -> Content

    var body: some View {
        ZStack {
            if isActive {
                Color(.black).opacity(0.6)
                    .onTapGesture {
                        self.dismissView()
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
            .padding(.bottom, -draggedOffset.height)
            .background(Color(backgroundColor))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.height > 0 {
                            self.draggedOffset = value.translation
                        } else if value.translation.height > -150 {
                            self.draggedOffset = value.translation
                        }
                }
                .onEnded(){ _ in
                    if self.draggedOffset.height > 100 {
                        self.dismissView()
                    } else {
                        self.draggedOffset = .zero
                    }
                }
        )
    }

    func dismissView() {
        withAnimation {
            self.isActive = false
        }
        self.draggedOffset = .zero
    }
}
