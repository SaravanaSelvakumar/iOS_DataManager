//
//  AEOTPTextField.swift
//  Tutor
//
//  Created by Apzzo Technologies Private Limited on 02/05/24.
//

import Foundation
import UIKit

public protocol AEOTPTextFieldDelegate: AnyObject {
    func didUserFinishEnter(the code: String)
}

public class AEOTPTextField: UITextField {
    public var otpDefaultCharacter = ""
    public var otpBackgroundColor: UIColor = UIColor.init(hexStr: "F3F5FC")
    public var otpFilledBackgroundColor: UIColor = UIColor.white
    public var otpCornerRaduis: CGFloat = 10
    public var otpDefaultBorderColor: UIColor = UIColor.black
    public var otpFilledBorderColor: UIColor = UIColor.init(hexStr: "4E82DC")
    public var otpDefaultBorderWidth: CGFloat = 0
    public var otpFilledBorderWidth: CGFloat = 1
    public var otpTextColor: UIColor = .black
    public var otpFontSize: CGFloat = 24
    public var otpFont: UIFont = UIFont.systemFont(ofSize: 24)
    public weak var otpDelegate: AEOTPTextFieldDelegate?
    private var implementation = AEOTPTextFieldImplementation()
    private var isConfigured = false
    var digitLabels = [UILabel]()
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    ///  Configure textfield view
    public func configure(with slotCount: Int = 4) {
        if isConfigured { return }
        isConfigured.toggle()
        configureTextField()
        setToolbar()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    ///   Clear the textfield when user tab the resend
    func clearOTPText() {
        digitLabels.forEach({ $0.text = "" })
        text = ""
    }
    
    /// Setting the tool bar on top of keyboard. It has done button and placeholder text on it.
    func setToolbar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        toolBar.barStyle = .default
        toolBar.backgroundColor = .lightGray
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(title: "DONE".capitalized,
                                            style: .plain,
                                            target: self,
                                            action: #selector(actionOnToolBarDone(sender:)))
        
        let placeHolderLabel = UILabel(frame: UIScreen.main.bounds)
        placeHolderLabel.text = placeholder ?? ""
        placeHolderLabel.sizeToFit()
        placeHolderLabel.textColor = UIColor.black
        placeHolderLabel.textAlignment = .left
        let placeHolderBarButton = UIBarButtonItem(customView: placeHolderLabel)
        
        toolBar.items = [placeHolderBarButton, flexibleSpace, doneBarButton]
        toolBar.sizeToFit()
        inputAccessoryView = toolBar
    }
    
    /// Action on tool bar done button.
    /// - Parameter sender: UIBarButtonItem
    @objc func actionOnToolBarDone(sender: UIBarButtonItem) {
        resignFirstResponder()
    }
    
    ///  Setup textfield color, keyboard type etc..
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        borderStyle = .none
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = implementation
        implementation.implementationDelegate = self
    }
    
    ///  Split the stackview
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        for _ in 1 ... count {
            let label = createLabel()
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        return stackView
    }
    
    /// Setup label for OTPtextfield
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = otpBackgroundColor
        label.layer.cornerRadius = otpCornerRaduis
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = otpTextColor
        label.font = label.font.withSize(otpFontSize)
        label.font = otpFont
        label.isUserInteractionEnabled = true
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.init(hexStr: "F3F5FC").cgColor
        label.text = otpDefaultCharacter
        return label
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        for labelIndex in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[labelIndex]
            if labelIndex < text.count {
                let index = text.index(text.startIndex, offsetBy: labelIndex)
                currentLabel.text = String(text[index])
                currentLabel.layer.borderWidth = otpFilledBorderWidth
                currentLabel.layer.borderColor = otpDefaultBorderColor.cgColor
                currentLabel.backgroundColor = otpBackgroundColor
            } else {
                currentLabel.text = otpDefaultCharacter
                currentLabel.layer.borderWidth = otpDefaultBorderWidth
                currentLabel.layer.borderColor = otpDefaultBorderColor.cgColor
                currentLabel.backgroundColor = otpBackgroundColor
            }
        }
        otpDelegate?.didUserFinishEnter(the: text)
    }
}

extension AEOTPTextField: AEOTPTextFieldImplementationProtocol {
    func digitalLabelsCount() -> Int {
        digitLabels.count
    }
}

protocol AEOTPTextFieldImplementationProtocol: AnyObject {
    func digitalLabelsCount() -> Int
}

class AEOTPTextFieldImplementation: NSObject, UITextFieldDelegate {
    weak var implementationDelegate: AEOTPTextFieldImplementationProtocol?
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < implementationDelegate?.digitalLabelsCount() ?? 0 || string == ""
    }
}
