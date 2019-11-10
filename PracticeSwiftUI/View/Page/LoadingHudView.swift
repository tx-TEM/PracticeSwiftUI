import SwiftUI

struct LoadingHudView<Content: View>: View {
    @State var isLoading = false
    @Binding var foregroundView: () -> Content

    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                print("tap")
            }, label: {
                Text("Show Loading")
            })

            Spacer()
        }
    }
}

//struct LoadingHudView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingHud()
//    }
//}
