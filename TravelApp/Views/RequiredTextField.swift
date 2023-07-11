//
//  RequiredTextField.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 10/07/23.
//

import SwiftUI

struct RequiredTextField: View {
    @Binding var text: String
    let placeholder: String
    let fieldName: String?
    let isRequired: Bool

    @State private var isEditing = false

    @Environment(\.formSubmitted) private var isFormSubmitted

    var body: some View {
        VStack(alignment: .leading) {
            if isRequired && (isEditing || isFormSubmitted) && text.isEmpty {
                Text(requiredFieldText)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 4)
            }

            TextField(placeholder, text: $text)
                .onTapGesture {
                    isEditing = true
                }
                .onSubmit {
                    isEditing = false
                }
                .preference(key: FormFieldPreferenceKey.self, value: FieldPreferenceData(fieldName: fieldName))
        }
    }

    private var requiredFieldText: String {
        if let fieldName = fieldName {
            return "\(fieldName) is required"
        } else {
            return "Field is required"
        }
    }
}

struct FormFieldPreferenceKey: PreferenceKey {
    static var defaultValue: FieldPreferenceData? = nil

    static func reduce(value: inout FieldPreferenceData?, nextValue: () -> FieldPreferenceData?) {
        if let nextValue = nextValue() {
            value = nextValue
        }
    }
}

struct FieldPreferenceData: Equatable {
    let fieldName: String?
}

extension EnvironmentValues {
    var formSubmitted: Bool {
        get { self[FormSubmittedKey.self] }
        set { self[FormSubmittedKey.self] = newValue }
    }
}

struct FormSubmittedKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension View {
    func captureFormSubmitted(_ value: Bool) -> some View {
        environment(\.formSubmitted, value)
    }
}

extension View {
    func superview<T>(ofType type: T.Type) -> T? {
        var superview: T?
        var currentView: UIView? = nil

        func findSuperview(view: UIView?) {
            guard let view = view else { return }

            if let view = view.next as? T {
                superview = view
            } else {
                findSuperview(view: view.superview)
            }
        }

        #if os(iOS)
        guard let rootView = UIApplication.shared.windows.first?.rootViewController?.view else {
            return nil
        }
        currentView = rootView
        findSuperview(view: currentView)
        #endif

        return superview
    }
}
