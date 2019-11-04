import Foundation
import SwiftUI


struct TextView: UIViewRepresentable {
    @Binding var text: String
    let configure: (UITextView) -> ()

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        // デフォルト設定
        textView.delegate = context.coordinator
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = true
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.maximumNumberOfLines = 1

        // カスタム設定
        configure(textView)
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
    }
}

extension TextView {
    final class Coordinator: NSObject, UITextViewDelegate {
        private var textView: TextView

        init(_ textView: TextView) {
            self.textView = textView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            // 変換中でないなら
            if textView.markedTextRange == nil {
                self.textView.text = textView.text
            }
        }
    }
}
