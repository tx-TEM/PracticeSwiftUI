import Foundation
import SwiftUI

struct UIKitTextField: UIViewRepresentable {
    @Binding var text: String
    let configure: (UITextField) -> ()

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        configure(textField)
        return textField
    }

    func updateUIView(_ textView: UITextField, context: Context) {
        textView.text = text
    }
}

extension UIKitTextField {
    final class Coordinator: NSObject, UITextFieldDelegate {
        private var textField: UIKitTextField

        init(_ textField: UIKitTextField) {
            self.textField = textField
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text {
                // 変換中でないなら
                if textField.markedTextRange == nil {
                    self.textField.text = textField.text ?? ""
                } else {

                }
            }
            return true
        }
    }
}
