//
//  SweetAlert.swift
//  
//
//  Created by Mihael Isaev on 02.04.2023.
//

import Web
import JavaScriptKit
#if canImport(Animate)
import Animate
#endif

public final class Swal {
    public static func configure(_ theme: SweetAlertTheme = .default) {
        let style = Link().rel(.stylesheet).href("/css/\(theme.value).css")
        WebApp.shared.document.head.appendChild(style)
        WebApp.shared.addScript("/js/sweetalert2.min.js")
    }
    
    private init () {}
    
    var closures: [JSClosure] = []
    
    var options: [String: ConvertibleToJSValue] = [:]
    
    /// The title of the popup, as HTML.
    @discardableResult
    public static func title(_ value: String) -> Self {
        Self().title(value)
    }
    
    /// The title of the popup, as HTML.
    @discardableResult
    public func title(_ value: String) -> Self {
        options["title"] = value.jsValue
        return self
    }
    
    var titleContent: DOM.Block?
    
    /// The title of the popup, as HTML.
    @discardableResult
    public static func title(@DOM content: @escaping DOM.Block) -> Self {
        Self().title(content: content)
    }
    
    /// The title of the popup, as HTML.
    @discardableResult
    public func title(@DOM content: @escaping DOM.Block) -> Self {
        options["title"] = #"<div id="swifweb-swal-title"></div>"#
        titleContent = content
        return self
    }
    
    /// The title of the popup, as text. Useful to avoid HTML injection.
    @discardableResult
    public static func titleText(_ value: String) -> Self {
        Self().titleText(value)
    }
    
    /// The title of the popup, as text. Useful to avoid HTML injection.
    @discardableResult
    public func titleText(_ value: String) -> Self {
        options["titleText"] = value.jsValue
        return self
    }
    
    /// A HTML description for the popup.
    /// If text and html parameters are provided in the same time, html will be used.
    @discardableResult
    public static func html(_ value: String) -> Self {
        Self().html(value)
    }
    
    /// A HTML description for the popup.
    /// If text and html parameters are provided in the same time, html will be used.
    @discardableResult
    public func html(_ value: String) -> Self {
        options["html"] = value.jsValue
        return self
    }
    
    var htmlContent: DOM.Block?
    
    /// A HTML description for the popup.
    /// If text and html parameters are provided in the same time, html will be used.
    @discardableResult
    public static func html(@DOM content: @escaping DOM.Block) -> Self {
        Self().html(content: content)
    }
    
    /// A HTML description for the popup.
    /// If text and html parameters are provided in the same time, html will be used.
    @discardableResult
    public func html(@DOM content: @escaping DOM.Block) -> Self {
        options["html"] = #"<div id="swifweb-swal-html"></div>"#
        htmlContent = content
        return self
    }
    
    /// A description for the popup.
    /// If text and html parameters are provided in the same time, html will be used.
    @discardableResult
    public static func text(_ value: String) -> Self {
        Self().text(value)
    }
    
    /// A description for the popup.
    /// If text and html parameters are provided in the same time, html will be used.
    @discardableResult
    public func text(_ value: String) -> Self {
        options["text"] = value.jsValue
        return self
    }
    
    /// The icon of the popup.
    @discardableResult
    public static func icon(_ value: SwalIcon) -> Self {
        Self().icon(value)
    }
    
    /// The icon of the popup.
    @discardableResult
    public func icon(_ value: SwalIcon) -> Self {
        options["icon"] = value.value.jsValue
        return self
    }
    
    /// Use this to change the color of the icon.
    @discardableResult
    public static func iconColor(_ value: Color) -> Self {
        Self().iconColor(value)
    }
    
    /// Use this to change the color of the icon.
    @discardableResult
    public func iconColor(_ value: Color) -> Self {
        options["iconColor"] = value.value.value.jsValue
        return self
    }
    
    /// The custom HTML content for an icon.
    @discardableResult
    public static func iconHtml(_ value: String) -> Self {
        Self().iconHtml(value)
    }
    
    /// The custom HTML content for an icon.
    @discardableResult
    public func iconHtml(_ value: String) -> Self {
        options["iconHtml"] = value.jsValue
        return self
    }
    
    var iconContent: DOM.Block?
    
    /// The custom HTML content for an icon.
    @discardableResult
    public static func iconHtml(@DOM content: @escaping DOM.Block) -> Self {
        Self().iconHtml(content: content)
    }
    
    /// The custom HTML content for an icon.
    @discardableResult
    public func iconHtml(@DOM content: @escaping DOM.Block) -> Self {
        options["iconHtml"] = #"<div id="swifweb-swal-icon"></div>"#
        iconContent = content
        return self
    }
    
    var showClasses: [String: String] = [:]
    
    /// CSS classes for animations when showing a popup (fade in)
    @discardableResult
    public static func showClass(popup: Class? = nil, backdrop: Class? = nil, icon: Class? = nil) -> Self {
        Self().showClass(popup: popup, backdrop: backdrop, icon: icon)
    }
    
    /// CSS classes for animations when showing a popup (fade in)
    @discardableResult
    public func showClass(popup: Class? = nil, backdrop: Class? = nil, icon: Class? = nil) -> Self {
        if let popup {
            showClasses["popup"] = popup.names.joined(separator: " ")
        }
        if let backdrop {
            showClasses["backdrop"] = backdrop.names.joined(separator: " ")
        }
        if let icon {
            showClasses["icon"] = icon.names.joined(separator: " ")
        }
        return self
    }
    
    #if canImport(Animate)
    /// CSS classes for animations when showing a popup (fade in)
    @discardableResult
    public static func showClass(
        animatePopup: AnimationType? = nil,
        animateBackdrop: AnimationType? = nil,
        animateIcon: AnimationType? = nil
    ) -> Self {
        Self().showClass(animatePopup: animatePopup, animateBackdrop: animateBackdrop, animateIcon: animateIcon)
    }
    
    /// CSS classes for animations when showing a popup (fade in)
    @discardableResult
    public func showClass(
        animatePopup: AnimationType? = nil,
        animateBackdrop: AnimationType? = nil,
        animateIcon: AnimationType? = nil
    ) -> Self {
        if let animatePopup {
            showClasses["popup"] = (Class.animated.names + animatePopup.class.names).joined(separator: " ")
        }
        if let animateBackdrop {
            showClasses["backdrop"] = (Class.animated.names + animateBackdrop.class.names).joined(separator: " ")
        }
        if let animateIcon {
            showClasses["icon"] = (Class.animated.names + animateIcon.class.names).joined(separator: " ")
        }
        return self
    }
    #endif
    
    var hideClasses: [String: String] = [:]
    
    /// CSS classes for animations when hiding a popup (fade out)
    @discardableResult
    public static func hideClass(popup: Class? = nil, backdrop: Class? = nil, icon: Class? = nil) -> Self {
        Self().hideClass(popup: popup, backdrop: backdrop, icon: icon)
    }
    
    /// CSS classes for animations when hiding a popup (fade out)
    @discardableResult
    public func hideClass(popup: Class? = nil, backdrop: Class? = nil, icon: Class? = nil) -> Self {
        if let popup {
            hideClasses["popup"] = popup.names.joined(separator: " ")
        }
        if let backdrop {
            hideClasses["backdrop"] = backdrop.names.joined(separator: " ")
        }
        if let icon {
            hideClasses["icon"] = icon.names.joined(separator: " ")
        }
        return self
    }
    
    #if canImport(Animate)
    /// CSS classes for animations when hiding a popup (fade out)
    @discardableResult
    public static func hideClass(
        animatePopup: AnimationType? = nil,
        animateBackdrop: AnimationType? = nil,
        animateIcon: AnimationType? = nil
    ) -> Self {
        Self().hideClass(animatePopup: animatePopup, animateBackdrop: animateBackdrop, animateIcon: animateIcon)
    }
    
    /// CSS classes for animations when hiding a popup (fade out)
    @discardableResult
    public func hideClass(
        animatePopup: AnimationType? = nil,
        animateBackdrop: AnimationType? = nil,
        animateIcon: AnimationType? = nil
    ) -> Self {
        if let animatePopup {
            hideClasses["popup"] = (Class.animated.names + animatePopup.class.names).joined(separator: " ")
        }
        if let animateBackdrop {
            hideClasses["backdrop"] = (Class.animated.names + animateBackdrop.class.names).joined(separator: " ")
        }
        if let animateIcon {
            hideClasses["icon"] = (Class.animated.names + animateIcon.class.names).joined(separator: " ")
        }
        return self
    }
    #endif
    
    /// The footer of the popup. Can be either plain text or HTML.
    @discardableResult
    public static func footer(_ value: String) -> Self {
        Self().footer(value)
    }
    
    /// The footer of the popup. Can be either plain text or HTML.
    @discardableResult
    public func footer(_ value: String) -> Self {
        options["footer"] = value.jsValue
        return self
    }
    
    var footerContent: DOM.Block?
    
    /// The footer of the popup. Can be either plain text or HTML.
    @discardableResult
    public static func footer(@DOM content: @escaping DOM.Block) -> Self {
        Self().footer(content: content)
    }
    
    /// The footer of the popup. Can be either plain text or HTML.
    @discardableResult
    public func footer(@DOM content: @escaping DOM.Block) -> Self {
        options["footer"] = #"<div id="swifweb-swal-footer"></div>"#
        footerContent = content
        return self
    }
    
    /// Whether or not SweetAlert2 should show a full screen click-to-dismiss backdrop.
    @discardableResult
    public static func backdrop(_ value: Bool = true) -> Self {
        Self().backdrop(value)
    }
    
    /// Whether or not SweetAlert2 should show a full screen click-to-dismiss backdrop.
    @discardableResult
    public func backdrop(_ value: Bool = true) -> Self {
        options["backdrop"] = value.jsValue
        return self
    }
    
    /// Whether or not SweetAlert2 should show a full screen click-to-dismiss backdrop.
    /// It will be assigned to the CSS background property.
    @discardableResult
    public static func backdrop(_ value: Color) -> Self {
        Self().backdrop(value)
    }
    
    /// Whether or not SweetAlert2 should show a full screen click-to-dismiss backdrop.
    /// It will be assigned to the CSS background property.
    @discardableResult
    public func backdrop(_ value: Color) -> Self {
        options["backdrop"] = value.value.value.jsValue
        return self
    }
    
    /// Whether or not an alert should be treated as a toast notification.
    /// This option is normally coupled with the position parameter and a timer.
    /// Toasts are NEVER autofocused.
    @discardableResult
    public static func toast(_ value: Bool = true) -> Self {
        Self().toast(value)
    }
    
    /// Whether or not an alert should be treated as a toast notification.
    /// This option is normally coupled with the position parameter and a timer.
    /// Toasts are NEVER autofocused.
    @discardableResult
    public func toast(_ value: Bool = true) -> Self {
        options["toast"] = value.jsValue
        return self
    }
    
    /// The container element for adding popup into.
    @discardableResult
    public static func target(_ value: String) -> Self {
        Self().target(value)
    }
    
    /// The container element for adding popup into.
    @discardableResult
    public func target(_ value: String) -> Self {
        options["target"] = value.jsValue
        return self
    }
    
    /// Input field type.
    @discardableResult
    public static func input(_ value: SwalInputType) -> Self {
        Self().input(value)
    }
    
    /// Input field type.
    @discardableResult
    public func input(_ value: SwalInputType) -> Self {
        options["input"] = value.rawValue.jsValue
        return self
    }
    
    /// Popup window width, including paddings (box-sizing: border-box).
    @discardableResult
    public static func width<U: UnitValuable>(_ value: U) -> Self {
        Self().width(value)
    }
    
    /// Popup window width, including paddings (box-sizing: border-box).
    @discardableResult
    public func width<U: UnitValuable>(_ value: U) -> Self {
        options["width"] = value.description.jsValue
        return self
    }
    
    /// Popup window padding.
    @discardableResult
    public static func padding<U: UnitValuable>(_ value: U) -> Self {
        Self().padding(value)
    }
    
    /// Popup window padding.
    @discardableResult
    public func padding<U: UnitValuable>(_ value: U) -> Self {
        options["padding"] = value.description.jsValue
        return self
    }
    
    /// Popup window padding.
    @discardableResult
    public static func padding<V: UnitValuable, H: UnitValuable>(v: V, h: H) -> Self {
        Self().padding(v: v, h: h)
    }
    
    /// Popup window padding.
    @discardableResult
    public func padding<V: UnitValuable, H: UnitValuable>(v: V, h: H) -> Self {
        options["padding"] = "\(v.description) \(h.description)".jsValue
        return self
    }
    
    /// Popup window padding.
    @discardableResult
    public static func padding<T: UnitValuable, H: UnitValuable, B: UnitValuable>(top: T, h: H, bottom: B) -> Self {
        Self().padding(top: top, h: h, bottom: bottom)
    }
    
    /// Popup window padding.
    @discardableResult
    public func padding<T: UnitValuable, H: UnitValuable, B: UnitValuable>(top: T, h: H, bottom: B) -> Self {
        options["padding"] = "\(top.description) \(h.description) \(bottom.description)".jsValue
        return self
    }
    
    /// Popup window padding.
    @discardableResult
    public static func padding<T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) -> Self {
        Self().padding(top: top, right: right, bottom: bottom, left: left)
    }
    
    /// Popup window padding.
    @discardableResult
    public func padding<T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) -> Self {
        options["padding"] = "\(top.description) \(right.description) \(bottom.description) \(left.description)".jsValue
        return self
    }
    
    /// Color for title, content and footer.
    @discardableResult
    public static func color(_ value: Color) -> Self {
        Self().color(value)
    }
    
    /// Color for title, content and footer.
    @discardableResult
    public func color(_ value: Color) -> Self {
        options["color"] = value.value.value.jsValue
        return self
    }
    
    /// Color for title, content and footer.
    @discardableResult
    public static func background(_ value: Color) -> Self {
        Self().background(value)
    }
    
    /// Color for title, content and footer.
    @discardableResult
    public func background(_ value: Color) -> Self {
        options["background"] = value.value.value.jsValue
        return self
    }
    
    /// Popup window position.
    @discardableResult
    public static func position(_ value: SwalPosition) -> Self {
        Self().position(value)
    }
    
    /// Popup window position.
    @discardableResult
    public func position(_ value: SwalPosition) -> Self {
        options["position"] = value.rawValue.jsValue
        return self
    }
    
    /// Popup window position.
    @discardableResult
    public static func grow(_ value: SwalGrow? = nil) -> Self {
        Self().grow(value)
    }
    
    /// Popup window position.
    @discardableResult
    public func grow(_ value: SwalGrow? = nil) -> Self {
        options["grow"] = value?.rawValue.jsValue ?? false.jsValue
        return self
    }
    
    var customClass: [String: String] = [:]
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(container value: Class) -> Self {
        Self().customClass(container: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(container value: Class) -> Self {
        customClass["container"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(popup value: Class) -> Self {
        Self().customClass(popup: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(popup value: Class) -> Self {
        customClass["popup"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(header value: Class) -> Self {
        Self().customClass(header: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(header value: Class) -> Self {
        customClass["header"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(title value: Class) -> Self {
        Self().customClass(title: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(title value: Class) -> Self {
        customClass["title"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(closeButton value: Class) -> Self {
        Self().customClass(closeButton: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(closeButton value: Class) -> Self {
        customClass["closeButton"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(icon value: Class) -> Self {
        Self().customClass(icon: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(icon value: Class) -> Self {
        customClass["icon"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(image value: Class) -> Self {
        Self().customClass(image: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(image value: Class) -> Self {
        customClass["image"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(htmlContainer value: Class) -> Self {
        Self().customClass(htmlContainer: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(htmlContainer value: Class) -> Self {
        customClass["htmlContainer"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(input value: Class) -> Self {
        Self().customClass(input: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(input value: Class) -> Self {
        customClass["input"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(inputLabel value: Class) -> Self {
        Self().customClass(inputLabel: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(inputLabel value: Class) -> Self {
        customClass["inputLabel"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(validationMessage value: Class) -> Self {
        Self().customClass(validationMessage: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(validationMessage value: Class) -> Self {
        customClass["validationMessage"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(actions value: Class) -> Self {
        Self().customClass(actions: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(actions value: Class) -> Self {
        customClass["actions"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(confirmButton value: Class) -> Self {
        Self().customClass(confirmButton: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(confirmButton value: Class) -> Self {
        customClass["confirmButton"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(denyButton value: Class) -> Self {
        Self().customClass(denyButton: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(denyButton value: Class) -> Self {
        customClass["denyButton"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(cancelButton value: Class) -> Self {
        Self().customClass(cancelButton: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(cancelButton value: Class) -> Self {
        customClass["cancelButton"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(loader value: Class) -> Self {
        Self().customClass(loader: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(loader value: Class) -> Self {
        customClass["loader"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(footer value: Class) -> Self {
        Self().customClass(footer: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(footer value: Class) -> Self {
        customClass["footer"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public static func customClass(timerProgressBar value: Class) -> Self {
        Self().customClass(timerProgressBar: value)
    }
    
    /// A custom CSS class for the popup.
    @discardableResult
    public func customClass(timerProgressBar value: Class) -> Self {
        customClass["timerProgressBar"] = value.names.joined(separator: " ")
        options["customClass"] = customClass.jsValue
        return self
    }
    
    /// Auto close timer of the popup. Set in seconds.
    @discardableResult
    public static func timer(_ value: Double) -> Self {
        Self().timer(value)
    }
    
    /// Auto close timer of the popup. Set in seconds.
    @discardableResult
    public func timer(_ value: Double) -> Self {
        options["timer"] = (value * 1_000).jsValue
        return self
    }
    
    /// If set to true, the timer will have a progress bar at the bottom of a popup.
    /// Mostly, this feature is useful with toasts.
    @discardableResult
    public static func timerProgressBar(_ value: Bool = true) -> Self {
        Self().timerProgressBar(value)
    }
    
    /// If set to true, the timer will have a progress bar at the bottom of a popup.
    /// Mostly, this feature is useful with toasts.
    @discardableResult
    public func timerProgressBar(_ value: Bool = true) -> Self {
        options["timerProgressBar"] = value.jsValue
        return self
    }
    
    /// By default, SweetAlert2 sets html's and body's CSS height to `auto !important`.
    /// If this behavior isn't compatible with your project's layout, set `heightAuto` to `false`.
    @discardableResult
    public static func heightAuto(_ value: Bool = true) -> Self {
        Self().heightAuto(value)
    }
    
    /// By default, SweetAlert2 sets html's and body's CSS height to `auto !important`.
    /// If this behavior isn't compatible with your project's layout, set `heightAuto` to `false`.
    @discardableResult
    public func heightAuto(_ value: Bool = true) -> Self {
        options["heightAuto"] = value.jsValue
        return self
    }
    
    /// If set to false, the user can't dismiss the popup by clicking outside it.
    /// You can also pass a custom function returning a boolean value,
    /// e.g. if you want to disable outside clicks for the loading state of a popup.
    @discardableResult
    public static func allowOutsideClick(_ value: Bool = true) -> Self {
        Self().allowOutsideClick(value)
    }
    
    /// If set to false, the user can't dismiss the popup by clicking outside it.
    /// You can also pass a custom function returning a boolean value,
    /// e.g. if you want to disable outside clicks for the loading state of a popup.
    @discardableResult
    public func allowOutsideClick(_ value: Bool = true) -> Self {
        options["allowOutsideClick"] = value.jsValue
        return self
    }
    
    /// If set to false, the user can't dismiss the popup by pressing the Esc key.
    /// You can also pass a custom function returning a boolean value,
    /// e.g. if you want to disable the Esc key for the loading state of a popup.
    @discardableResult
    public static func allowEscapeKey(_ value: Bool = true) -> Self {
        Self().allowEscapeKey(value)
    }
    
    /// If set to false, the user can't dismiss the popup by pressing the Esc key.
    /// You can also pass a custom function returning a boolean value,
    /// e.g. if you want to disable the Esc key for the loading state of a popup.
    @discardableResult
    public func allowEscapeKey(_ value: Bool = true) -> Self {
        options["allowEscapeKey"] = value.jsValue
        return self
    }
    
    /// If set to false, the user can't confirm the popup by pressing the Enter
    /// or Space keys, unless they manually focus the confirm button.
    /// You can also pass a custom function returning a boolean value.
    @discardableResult
    public static func allowEnterKey(_ value: Bool = true) -> Self {
        Self().allowEnterKey(value)
    }
    
    /// If set to false, the user can't confirm the popup by pressing the Enter
    /// or Space keys, unless they manually focus the confirm button.
    /// You can also pass a custom function returning a boolean value.
    @discardableResult
    public func allowEnterKey(_ value: Bool = true) -> Self {
        options["allowEnterKey"] = value.jsValue
        return self
    }
    
    /// If set to false, SweetAlert2 will allow keydown events propagation to the document.
    @discardableResult
    public static func stopKeydownPropagation(_ value: Bool = true) -> Self {
        Self().stopKeydownPropagation(value)
    }
    
    /// If set to false, SweetAlert2 will allow keydown events propagation to the document.
    @discardableResult
    public func stopKeydownPropagation(_ value: Bool = true) -> Self {
        options["stopKeydownPropagation"] = value.jsValue
        return self
    }
    
    /// Useful for those who are using SweetAlert2 along with Bootstrap modals.
    /// By default `keydownListenerCapture` is `false` which means when a user hits `Esc`,
    /// both SweetAlert2 and Bootstrap modals will be closed.
    /// Set `keydownListenerCapture` to `true` to fix that behavior.
    @discardableResult
    public static func keydownListenerCapture(_ value: Bool = true) -> Self {
        Self().keydownListenerCapture(value)
    }
    
    /// Useful for those who are using SweetAlert2 along with Bootstrap modals.
    /// By default `keydownListenerCapture` is `false` which means when a user hits `Esc`,
    /// both SweetAlert2 and Bootstrap modals will be closed.
    /// Set `keydownListenerCapture` to `true` to fix that behavior.
    @discardableResult
    public func keydownListenerCapture(_ value: Bool = true) -> Self {
        options["keydownListenerCapture"] = value.jsValue
        return self
    }
    
    /// If set to false, a "Confirm"-button will not be shown.
    @discardableResult
    public static func showConfirmButton(_ value: Bool = true) -> Self {
        Self().showConfirmButton(value)
    }
    
    /// If set to false, a "Confirm"-button will not be shown.
    @discardableResult
    public func showConfirmButton(_ value: Bool = true) -> Self {
        options["showConfirmButton"] = value.jsValue
        return self
    }
    
    /// If set to true, a "Deny"-button will be shown.
    /// It can be useful when you want a popup with 3 buttons.
    @discardableResult
    public static func showDenyButton(_ value: Bool = true) -> Self {
        Self().showDenyButton(value)
    }
    
    /// If set to true, a "Deny"-button will be shown.
    /// It can be useful when you want a popup with 3 buttons.
    @discardableResult
    public func showDenyButton(_ value: Bool = true) -> Self {
        options["showDenyButton"] = value.jsValue
        return self
    }
    
    /// If set to true, a "Cancel"-button will be shown,
    /// which the user can click on to dismiss the modal.
    @discardableResult
    public static func showCancelButton(_ value: Bool = true) -> Self {
        Self().showCancelButton(value)
    }
    
    /// If set to true, a "Cancel"-button will be shown,
    /// which the user can click on to dismiss the modal.
    @discardableResult
    public func showCancelButton(_ value: Bool = true) -> Self {
        options["showCancelButton"] = value.jsValue
        return self
    }
    
    /// Use this to change the text on the "Confirm"-button.
    @discardableResult
    public static func confirmButtonText(_ value: String) -> Self {
        Self().confirmButtonText(value)
    }
    
    /// Use this to change the text on the "Confirm"-button.
    @discardableResult
    public func confirmButtonText(_ value: String) -> Self {
        options["confirmButtonText"] = value.jsValue
        return self
    }
    
    /// Use this to change the text on the "Deny"-button.
    @discardableResult
    public static func denyButtonText(_ value: String) -> Self {
        Self().denyButtonText(value)
    }
    
    /// Use this to change the text on the "Deny"-button.
    @discardableResult
    public func denyButtonText(_ value: String) -> Self {
        options["denyButtonText"] = value.jsValue
        return self
    }
    
    /// Use this to change the text on the "Cancel"-button.
    @discardableResult
    public static func cancelButtonText(_ value: String) -> Self {
        Self().cancelButtonText(value)
    }
    
    /// Use this to change the text on the "Cancel"-button.
    @discardableResult
    public func cancelButtonText(_ value: String) -> Self {
        options["cancelButtonText"] = value.jsValue
        return self
    }
    
    /// Use this to change the background color of the "Confirm"-button.
    /// The default color is #3085d6
    @discardableResult
    public static func confirmButtonColor(_ value: Color) -> Self {
        Self().confirmButtonColor(value)
    }
    
    /// Use this to change the background color of the "Confirm"-button.
    /// The default color is #3085d6
    @discardableResult
    public func confirmButtonColor(_ value: Color) -> Self {
        options["confirmButtonColor"] = value.value.value.jsValue
        return self
    }
    
    /// Use this to change the background color of the "Deny"-button.
    /// The default color is #dd6b55
    @discardableResult
    public static func denyButtonColor(_ value: Color) -> Self {
        Self().denyButtonColor(value)
    }
    
    /// Use this to change the background color of the "Deny"-button.
    /// The default color is #dd6b55
    @discardableResult
    public func denyButtonColor(_ value: Color) -> Self {
        options["denyButtonColor"] = value.value.value.jsValue
        return self
    }
    
    /// Use this to change the background color of the "Cancel"-button.
    /// The default color is #aaa
    @discardableResult
    public static func cancelButtonColor(_ value: Color) -> Self {
        Self().cancelButtonColor(value)
    }
    
    /// Use this to change the background color of the "Cancel"-button.
    /// The default color is #aaa
    @discardableResult
    public func cancelButtonColor(_ value: Color) -> Self {
        options["cancelButtonColor"] = value.value.value.jsValue
        return self
    }
    
    /// Use this to change the aria-label for the "Confirm"-button.
    @discardableResult
    public static func confirmButtonAriaLabel(_ value: String) -> Self {
        Self().confirmButtonAriaLabel(value)
    }
    
    /// Use this to change the aria-label for the "Confirm"-button.
    @discardableResult
    public func confirmButtonAriaLabel(_ value: String) -> Self {
        options["confirmButtonAriaLabel"] = value.jsValue
        return self
    }
    
    /// Use this to change the aria-label for the "Deny"-button.
    @discardableResult
    public static func denyButtonAriaLabel(_ value: String) -> Self {
        Self().denyButtonAriaLabel(value)
    }
    
    /// Use this to change the aria-label for the "Deny"-button.
    @discardableResult
    public func denyButtonAriaLabel(_ value: String) -> Self {
        options["denyButtonAriaLabel"] = value.jsValue
        return self
    }
    
    /// Use this to change the aria-label for the "Cancel"-button.
    @discardableResult
    public static func cancelButtonAriaLabel(_ value: String) -> Self {
        Self().cancelButtonAriaLabel(value)
    }
    
    /// Use this to change the aria-label for the "Cancel"-button.
    @discardableResult
    public func cancelButtonAriaLabel(_ value: String) -> Self {
        options["cancelButtonAriaLabel"] = value.jsValue
        return self
    }
    
    /// Apply default styling to buttons.
    /// If you want to use your own classes (e.g. Bootstrap classes) set this parameter to false.
    @discardableResult
    public static func buttonsStyling(_ value: Bool = true) -> Self {
        Self().buttonsStyling(value)
    }
    
    /// Apply default styling to buttons.
    /// If you want to use your own classes (e.g. Bootstrap classes) set this parameter to false.
    @discardableResult
    public func buttonsStyling(_ value: Bool = true) -> Self {
        options["buttonsStyling"] = value.jsValue
        return self
    }
    
    /// Set to true if you want to invert default buttons positions ("Confirm"-button on the right side).
    @discardableResult
    public static func reverseButtons(_ value: Bool = true) -> Self {
        Self().reverseButtons(value)
    }
    
    /// Set to true if you want to invert default buttons positions ("Confirm"-button on the right side).
    @discardableResult
    public func reverseButtons(_ value: Bool = true) -> Self {
        options["reverseButtons"] = value.jsValue
        return self
    }
    
    /// Set to false if you want to focus the first element
    /// in tab order instead of "Confirm"-button by default.
    @discardableResult
    public static func focusConfirm(_ value: Bool = true) -> Self {
        Self().focusConfirm(value)
    }
    
    /// Set to false if you want to focus the first element
    /// in tab order instead of "Confirm"-button by default.
    @discardableResult
    public func focusConfirm(_ value: Bool = true) -> Self {
        options["focusConfirm"] = value.jsValue
        return self
    }
    
    /// Set to false if you don't want to return the focus
    /// to the element that invoked the modal after the modal is closed.
    @discardableResult
    public static func returnFocus(_ value: Bool = true) -> Self {
        Self().returnFocus(value)
    }
    
    /// Set to false if you don't want to return the focus
    /// to the element that invoked the modal after the modal is closed.
    @discardableResult
    public func returnFocus(_ value: Bool = true) -> Self {
        options["returnFocus"] = value.jsValue
        return self
    }
    
    /// Set to true if you want to focus the "Deny"-button by default.
    @discardableResult
    public static func focusDeny(_ value: Bool = true) -> Self {
        Self().focusDeny(value)
    }
    
    /// Set to true if you want to focus the "Deny"-button by default.
    @discardableResult
    public func focusDeny(_ value: Bool = true) -> Self {
        options["focusDeny"] = value.jsValue
        return self
    }
    
    /// Set to true if you want to focus the "Cancel"-button by default.
    @discardableResult
    public static func focusCancel(_ value: Bool = true) -> Self {
        Self().focusCancel(value)
    }
    
    /// Set to true if you want to focus the "Cancel"-button by default.
    @discardableResult
    public func focusCancel(_ value: Bool = true) -> Self {
        options["focusCancel"] = value.jsValue
        return self
    }
    
    /// Set to true to show close button in top right corner of the popup.
    @discardableResult
    public static func showCloseButton(_ value: Bool = true) -> Self {
        Self().showCloseButton(value)
    }
    
    /// Set to true to show close button in top right corner of the popup.
    @discardableResult
    public func showCloseButton(_ value: Bool = true) -> Self {
        options["showCloseButton"] = value.jsValue
        return self
    }
    
    /// Use this to change the content of the close button.
    @discardableResult
    public static func closeButtonHtml(_ value: String) -> Self {
        Self().closeButtonHtml(value)
    }
    
    /// Use this to change the content of the close button.
    @discardableResult
    public func closeButtonHtml(_ value: String) -> Self {
        options["closeButtonHtml"] = value.jsValue
        return self
    }
    
    var closeContent: DOM.Block?
    
    /// Use this to change the content of the close button.
    @discardableResult
    public static func closeButtonHtml(@DOM content: @escaping DOM.Block) -> Self {
        Self().closeButtonHtml(content: content)
    }
    
    /// Use this to change the content of the close button.
    @discardableResult
    public func closeButtonHtml(@DOM content: @escaping DOM.Block) -> Self {
        options["closeButtonHtml"] = #"<div id="swifweb-swal-close"></div>"#
        closeContent = content
        return self
    }
    
    /// Use this to change the aria-label for the close button.
    @discardableResult
    public static func closeButtonAriaLabel(_ value: String) -> Self {
        Self().closeButtonAriaLabel(value)
    }
    
    /// Use this to change the aria-label for the close button.
    @discardableResult
    public func closeButtonAriaLabel(_ value: String) -> Self {
        options["closeButtonAriaLabel"] = value.jsValue
        return self
    }
    
    /// Use this to change the HTML content of the loader.
    @discardableResult
    public static func loaderHtml(_ value: String) -> Self {
        Self().loaderHtml(value)
    }
    
    /// Use this to change the HTML content of the loader.
    @discardableResult
    public func loaderHtml(_ value: String) -> Self {
        options["loaderHtml"] = value.jsValue
        return self
    }
    
    var loaderContent: DOM.Block?
    
    /// Use this to change the HTML content of the loader.
    @discardableResult
    public static func loaderHtml(@DOM content: @escaping DOM.Block) -> Self {
        Self().loaderHtml(content: content)
    }
    
    /// Use this to change the HTML content of the loader.
    @discardableResult
    public func loaderHtml(@DOM content: @escaping DOM.Block) -> Self {
        options["loaderHtml"] = #"<div id="swifweb-swal-loader"></div>"#
        loaderContent = content
        return self
    }
    
    /// Set to true to disable buttons and show the loader instead of the `Confirm` button.
    /// Use it in combination with the `preConfirm` parameter.
    @discardableResult
    public static func showLoaderOnConfirm(_ value: Bool = true) -> Self {
        Self().showLoaderOnConfirm(value)
    }
    
    /// Set to true to disable buttons and show the loader instead of the `Confirm` button.
    /// Use it in combination with the `preConfirm` parameter.
    @discardableResult
    public func showLoaderOnConfirm(_ value: Bool = true) -> Self {
        options["showLoaderOnConfirm"] = value.jsValue
        return self
    }
    
    /// Set to true to disable buttons and show the loader instead of the `Deny` button.
    /// Use it in combination with the `preDeny` parameter.
    @discardableResult
    public static func showLoaderOnDeny(_ value: Bool = true) -> Self {
        Self().showLoaderOnDeny(value)
    }
    
    /// Set to true to disable buttons and show the loader instead of the `Deny` button.
    /// Use it in combination with the `preDeny` parameter.
    @discardableResult
    public func showLoaderOnDeny(_ value: Bool = true) -> Self {
        options["showLoaderOnDeny"] = value.jsValue
        return self
    }
    
    /// Set to true to disable buttons and show the loader instead of the `Deny` button.
    /// Use it in combination with the `preDeny` parameter.
    @discardableResult
    public static func scrollbarPadding(_ value: Bool = true) -> Self {
        Self().scrollbarPadding(value)
    }
    
    /// Set to true to disable buttons and show the loader instead of the `Deny` button.
    /// Use it in combination with the `preDeny` parameter.
    @discardableResult
    public func scrollbarPadding(_ value: Bool = true) -> Self {
        options["scrollbarPadding"] = value.jsValue
        return self
    }
    
    /// Function to execute before confirming.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public static func preConfirm(_ handler: @escaping () -> JSValueCompatible) -> Self {
        Self().preConfirm(handler)
    }
    
    /// Function to execute before confirming.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public static func preConfirm(_ handler: @escaping () async -> JSValueCompatible) -> Self {
        Self().preConfirm(handler)
    }
    
    /// Function to execute before confirming.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public func preConfirm(_ handler: @escaping () -> JSValueCompatible) -> Self {
        let closure = JSClosure { _ in
            handler().jsValue
        }
        closures.append(closure)
        options["preConfirm"] = closure
        return self
    }
    
    /// Function to execute before confirming.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public func preConfirm(_ handler: @escaping () async -> JSValueCompatible) -> Self {
        let closure = JSClosure.async { _ in
            await handler().jsValue
        }
        closures.append(closure)
        options["preConfirm"] = closure
        return self
    }
    
    var preDenyClosures: [JSClosure] = []
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public static func preDeny(_ handler: @escaping () -> JSValueCompatible) -> Self {
        Self().preDeny(handler)
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public static func preDeny(_ handler: @escaping () async -> JSValueCompatible) -> Self {
        Self().preDeny(handler)
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public func preDeny(_ handler: @escaping () -> JSValueCompatible) -> Self {
        preDenyClosures = [JSClosure { _ in
            handler().jsValue
        }]
        options["preDeny"] = preDenyClosures.first!
        return self
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public func preDeny(_ handler: @escaping () async -> JSValueCompatible) -> Self {
        preDenyClosures = [JSClosure.async { _ in
            await handler().jsValue
        }]
        options["preDeny"] = preDenyClosures.first!
        return self
    }
    
    /// If you want to return the input value as result.value
    /// when denying the popup, set to true.
    /// Otherwise, the denying will set result.value to false.
    @discardableResult
    public static func returnInputValueOnDeny(_ value: Bool = true) -> Self {
        Self().returnInputValueOnDeny(value)
    }
    
    /// If you want to return the input value as result.value
    /// when denying the popup, set to true.
    /// Otherwise, the denying will set result.value to false.
    @discardableResult
    public func returnInputValueOnDeny(_ value: Bool = true) -> Self {
        options["returnInputValueOnDeny"] = value.jsValue
        return self
    }
    
    /// If you want to return the input value as result.value
    /// when denying the popup, set to true.
    /// Otherwise, the denying will set result.value to false.
    @discardableResult
    public static func imageUrl<U: URLConformable>(_ value: U) -> Self {
        Self().imageUrl(value)
    }
    
    /// If you want to return the input value as result.value
    /// when denying the popup, set to true.
    /// Otherwise, the denying will set result.value to false.
    @discardableResult
    public func imageUrl<U: URLConformable>(_ value: U) -> Self {
        options["imageUrl"] = value.stringValue.jsValue
        return self
    }
    
    /// If imageUrl is set, you can specify imageWidth to describes image width.
    /// Can be in any CSS unit (px, em/rem, %).
    @discardableResult
    public static func imageWidth<U: UnitValuable>(_ value: U) -> Self {
        Self().imageWidth(value)
    }
    
    /// If imageUrl is set, you can specify imageWidth to describes image width.
    /// Can be in any CSS unit (px, em/rem, %).
    @discardableResult
    public func imageWidth<U: UnitValuable>(_ value: U) -> Self {
        options["imageWidth"] = value.description.jsValue
        return self
    }
    
    /// Custom image height.
    /// Can be in any CSS unit (px, em/rem, %).
    @discardableResult
    public static func imageHeight<U: UnitValuable>(_ value: U) -> Self {
        Self().imageHeight(value)
    }
    
    /// Custom image height.
    /// Can be in any CSS unit (px, em/rem, %).
    @discardableResult
    public func imageHeight<U: UnitValuable>(_ value: U) -> Self {
        options["imageHeight"] = value.description.jsValue
        return self
    }
    
    /// An alternative text for the custom image icon.
    @discardableResult
    public static func imageAlt(_ value: String) -> Self {
        Self().imageAlt(value)
    }
    
    /// An alternative text for the custom image icon.
    @discardableResult
    public func imageAlt(_ value: String) -> Self {
        options["imageAlt"] = value.jsValue
        return self
    }
    
    /// Input field label.
    @discardableResult
    public static func inputLabel(_ value: String) -> Self {
        Self().inputLabel(value)
    }
    
    /// Input field label.
    @discardableResult
    public func inputLabel(_ value: String) -> Self {
        options["inputLabel"] = value.jsValue
        return self
    }
    
    /// Input field placeholder.
    @discardableResult
    public static func inputPlaceholder(_ value: String) -> Self {
        Self().inputPlaceholder(value)
    }
    
    /// Input field placeholder.
    @discardableResult
    public func inputPlaceholder(_ value: String) -> Self {
        options["inputPlaceholder"] = value.jsValue
        return self
    }
    
    /// Input field initial value.
    /// If the input type is `<select>`, inputValue will represent the selected `<option>` tag.
    /// If the input type is `checkbox`, inputValue will represent the `checked` state.
    @discardableResult
    public static func inputValue(_ value: String) -> Self {
        Self().inputValue(value)
    }
    
    /// Input field initial value.
    /// If the input type is `<select>`, inputValue will represent the selected `<option>` tag.
    /// If the input type is `checkbox`, inputValue will represent the `checked` state.
    @discardableResult
    public func inputValue(_ value: String) -> Self {
        options["inputValue"] = value.jsValue
        return self
    }
    
    /// Input field initial value.
    /// If the input type is `<select>`, inputValue will represent the selected `<option>` tag.
    /// If the input type is `checkbox`, inputValue will represent the `checked` state.
    @discardableResult
    public static func inputValue(_ value: Bool = true) -> Self {
        Self().inputValue(value)
    }
    
    /// Input field initial value.
    /// If the input type is `<select>`, inputValue will represent the selected `<option>` tag.
    /// If the input type is `checkbox`, inputValue will represent the `checked` state.
    @discardableResult
    public func inputValue(_ value: Bool = true) -> Self {
        options["inputValue"] = value.jsValue
        return self
    }
    
    /// Input field placeholder.
    @discardableResult
    public static func inputOptions(_ value: [String: ConvertibleToJSValue]) -> Self {
        Self().inputOptions(value)
    }
    
    /// Input field placeholder.
    @discardableResult
    public func inputOptions(_ value: [String: ConvertibleToJSValue]) -> Self {
        options["inputOptions"] = value.jsValue
        return self
    }
    
    /// Automatically focus the input when popup is shown.
    /// Set this parameter to false to disable auto-focusing.
    @discardableResult
    public static func inputAutoFocus(_ value: Bool = true) -> Self {
        Self().inputAutoFocus(value)
    }
    
    /// Automatically focus the input when popup is shown.
    /// Set this parameter to false to disable auto-focusing.
    @discardableResult
    public func inputAutoFocus(_ value: Bool = true) -> Self {
        options["inputAutoFocus"] = value.jsValue
        return self
    }
    
    /// Automatically remove whitespaces from both ends of a result string.
    /// Set this parameter to false to disable auto-trimming.
    @discardableResult
    public static func inputAutoTrim(_ value: Bool = true) -> Self {
        Self().inputAutoTrim(value)
    }
    
    /// Automatically remove whitespaces from both ends of a result string.
    /// Set this parameter to false to disable auto-trimming.
    @discardableResult
    public func inputAutoTrim(_ value: Bool = true) -> Self {
        options["inputAutoTrim"] = value.jsValue
        return self
    }
    
    /// HTML input attributes (e.g. min, max, autocomplete, accept),
    /// that are added to the input field. Object keys will represent attributes names,
    /// object values will represent attributes values.
    @discardableResult
    public static func inputAttributes(_ value: [String: ConvertibleToJSValue]) -> Self {
        Self().inputAttributes(value)
    }
    
    /// HTML input attributes (e.g. min, max, autocomplete, accept),
    /// that are added to the input field. Object keys will represent attributes names,
    /// object values will represent attributes values.
    @discardableResult
    public func inputAttributes(_ value: [String: ConvertibleToJSValue]) -> Self {
        options["inputAttributes"] = value.jsValue
        return self
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public static func inputValidator(_ handler: @escaping () -> String?) -> Self {
        Self().inputValidator(handler)
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public static func inputValidator(_ handler: @escaping () async -> String?) -> Self {
        Self().inputValidator(handler)
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public func inputValidator(_ handler: @escaping () -> String?) -> Self {
        options["inputValidator"] = JSOneshotClosure { _ in
            handler()?.jsValue ?? .undefined
        }
        return self
    }
    
    /// Function to execute before denying.
    /// Returned (or resolved) value can be:
    ///    - **false** to prevent a popup from closing
    ///    - **undefined** to keep the default result.value
    ///    - anything else to pass that value as the result.value of Swal.fire()
    @discardableResult
    public func inputValidator(_ handler: @escaping () async -> String?) -> Self {
        options["inputValidator"] = JSOneshotClosure.async { _ in
            await handler()?.jsValue ?? .undefined
        }
        return self
    }
    
    /// A custom validation message for default validators (email, url).
    @discardableResult
    public static func validationMessage(_ value: String) -> Self {
        Self().validationMessage(value)
    }
    
    /// A custom validation message for default validators (email, url).
    @discardableResult
    public func validationMessage(_ value: String) -> Self {
        options["validationMessage"] = value.jsValue
        return self
    }
    
    /// Progress steps, useful for queues.
    @discardableResult
    public static func progressSteps(_ value: String...) -> Self {
        Self().progressSteps(value)
    }
    
    /// Progress steps, useful for queues.
    @discardableResult
    public static func progressSteps(_ value: [String]) -> Self {
        Self().progressSteps(value)
    }
    
    /// Progress steps, useful for queues.
    @discardableResult
    public func progressSteps(_ value: String...) -> Self {
        progressSteps(value)
    }
    
    /// Progress steps, useful for queues.
    @discardableResult
    public func progressSteps(_ value: [String]) -> Self {
        options["progressSteps"] = value.jsValue
        return self
    }
    
    /// Current active progress step.
    @discardableResult
    public static func currentProgressStep(_ value: UInt) -> Self {
        Self().currentProgressStep(value)
    }
    
    /// Current active progress step.
    @discardableResult
    public func currentProgressStep(_ value: UInt) -> Self {
        options["currentProgressStep"] = value.jsValue
        return self
    }
    
    /// Distance between progress steps.
    /// Can be in any CSS unit (px, em/rem, %).
    @discardableResult
    public static func progressStepsDistance<U: UnitValuable>(_ value: U) -> Self {
        Self().progressStepsDistance(value)
    }
    
    /// Distance between progress steps.
    /// Can be in any CSS unit (px, em/rem, %).
    @discardableResult
    public func progressStepsDistance<U: UnitValuable>(_ value: U) -> Self {
        options["progressStepsDistance"] = value.description.jsValue
        return self
    }
    
    // MARK: Lifecycle
    
    var willOpenHandlers: [(DOMElement) -> Void] = []
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    /// Provides popup DOM element as the argument.
    @discardableResult
    public static func willOpen(_ handler: @escaping (DOMElement) -> Void) -> Self {
        Self().willOpen(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    @discardableResult
    public static func willOpen(_ handler: @escaping () -> Void) -> Self {
        Self().willOpen(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    @discardableResult
    public func willOpen(_ handler: @escaping () -> Void) -> Self {
        willOpen { _ in
            handler()
        }
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    /// Provides popup DOM element as the argument.
    @discardableResult
    public func willOpen(_ handler: @escaping (DOMElement) -> Void) -> Self {
        willOpenHandlers.append(handler)
        return self
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    /// Provides popup DOM element as the argument.
    @discardableResult
    public static func didOpen(_ handler: @escaping (DOMElement) -> Void) -> Self {
        Self().didOpen(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    @discardableResult
    public static func didOpen(_ handler: @escaping () -> Void) -> Self {
        Self().didOpen(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs before the popup is shown on screen.
    @discardableResult
    public func didOpen(_ handler: @escaping () -> Void) -> Self {
        didOpen { _ in
            handler()
        }
    }
    
    /// Popup lifecycle hook.
    /// Asynchronously runs after the popup has been shown on screen.
    /// Provides popup DOM element as the argument.
    @discardableResult
    public func didOpen(_ handler: @escaping (DOMElement) -> Void) -> Self {
        options["didOpen"] = JSOneshotClosure { args in
            guard let jsValue = args.first else { return .undefined }
            handler(BaseElement(jsValue))
            return .undefined
        }
        return self
    }
    
    /// Popup lifecycle hook. Synchronously runs after the popup DOM has been updated
    /// (ie. just before the popup is repainted on the screen).
    /// Provides popup DOM element as the argument.
    ///
    /// Typically, this will happen after Swal.fire() or Swal.update().
    ///
    /// If you want to perform changes in the popup's DOM,
    /// that survive Swal.update(), prefer didRender over willOpen.
    @discardableResult
    public static func didRender(_ handler: @escaping (DOMElement) -> Void) -> Self {
        Self().didRender(handler)
    }
    
    /// Popup lifecycle hook. Synchronously runs after the popup DOM has been updated
    /// (ie. just before the popup is repainted on the screen).
    /// Provides popup DOM element as the argument.
    ///
    /// Typically, this will happen after Swal.fire() or Swal.update().
    ///
    /// If you want to perform changes in the popup's DOM,
    /// that survive Swal.update(), prefer didRender over willOpen.
    @discardableResult
    public func didRender(_ handler: @escaping (DOMElement) -> Void) -> Self {
        options["didRender"] = JSOneshotClosure { args in
            guard let jsValue = args.first else { return .undefined }
            handler(BaseElement(jsValue))
            return .undefined
        }
        return self
    }
    
    var willCloseHandlers: [(DOMElement) -> Void] = []
    
    /// Popup lifecycle hook.
    /// Synchronously runs when the popup closes by user interaction (and not due to another popup being fired).
    /// Provides popup DOM element as the argument.
    @discardableResult
    public static func willClose(_ handler: @escaping (DOMElement) -> Void) -> Self {
        Self().willClose(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs when the popup closes by user interaction (and not due to another popup being fired).
    @discardableResult
    public static func willClose(_ handler: @escaping () -> Void) -> Self {
        Self().willClose(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs when the popup closes by user interaction (and not due to another popup being fired).
    @discardableResult
    public func willClose(_ handler: @escaping () -> Void) -> Self {
        willClose { _ in
            handler()
        }
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs when the popup closes by user interaction (and not due to another popup being fired).
    /// Provides popup DOM element as the argument.
    @discardableResult
    public func willClose(_ handler: @escaping (DOMElement) -> Void) -> Self {
        willCloseHandlers.append(handler)
        return self
    }
    
    /// Popup lifecycle hook.
    /// Asynchronously runs after the popup has been disposed by user interaction
    /// (and not due to another popup being fired).
    @discardableResult
    public static func didClose(_ handler: @escaping (DOMElement) -> Void) -> Self {
        Self().didClose(handler)
    }
    
    /// Popup lifecycle hook.
    /// Asynchronously runs after the popup has been disposed by user interaction
    /// (and not due to another popup being fired).
    @discardableResult
    public static func didClose(_ handler: @escaping () -> Void) -> Self {
        Self().didClose(handler)
    }
    
    /// Popup lifecycle hook.
    /// Asynchronously runs after the popup has been disposed by user interaction
    /// (and not due to another popup being fired).
    @discardableResult
    public func didClose(_ handler: @escaping () -> Void) -> Self {
        didClose { _ in
            handler()
        }
    }
    
    /// Popup lifecycle hook.
    /// Asynchronously runs after the popup has been disposed by user interaction
    /// (and not due to another popup being fired).
    @discardableResult
    public func didClose(_ handler: @escaping (DOMElement) -> Void) -> Self {
        options["didClose"] = JSOneshotClosure { args in
            guard let jsValue = args.first else { return .undefined }
            handler(BaseElement(jsValue))
            return .undefined
        }
        return self
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs after popup has been destroyed
    /// either by user interaction or by another popup.
    /// If you have cleanup operations that you need to reliably
    /// execute each time a popup is closed, prefer didDestroy over didClose.
    @discardableResult
    public static func didDestroy(_ handler: @escaping (DOMElement) -> Void) -> Self {
        Self().didDestroy(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs after popup has been destroyed
    /// either by user interaction or by another popup.
    /// If you have cleanup operations that you need to reliably
    /// execute each time a popup is closed, prefer didDestroy over didClose.
    @discardableResult
    public static func didDestroy(_ handler: @escaping () -> Void) -> Self {
        Self().didDestroy(handler)
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs after popup has been destroyed
    /// either by user interaction or by another popup.
    /// If you have cleanup operations that you need to reliably
    /// execute each time a popup is closed, prefer didDestroy over didClose.
    @discardableResult
    public func didDestroy(_ handler: @escaping () -> Void) -> Self {
        didDestroy { _ in
            handler()
        }
    }
    
    /// Popup lifecycle hook.
    /// Synchronously runs after popup has been destroyed
    /// either by user interaction or by another popup.
    /// If you have cleanup operations that you need to reliably
    /// execute each time a popup is closed, prefer didDestroy over didClose.
    @discardableResult
    public func didDestroy(_ handler: @escaping (DOMElement) -> Void) -> Self {
        options["didDestroy"] = JSOneshotClosure { args in
            guard let jsValue = args.first else { return .undefined }
            handler(BaseElement(jsValue))
            return .undefined
        }
        return self
    }

    @discardableResult
    public static func fire() -> Self {
        Self().fire()
    }
    
    public enum DismissReason: String {
        case backdrop, cancel, close, esc, timer
    }
    
    public struct SwalResult {
        public let isConfirmed: Bool
        public let isDenied: Bool
        public let isDismissed: Bool
        public let dismiss: DismissReason?
        public let value: JSValue
    }
    
    @discardableResult
    public static func fire(_ title: String, _ handler: ((SwalResult) -> Void)? = nil) -> Self {
        Self().fire(title, handler)
    }
    
    @discardableResult
    public func fire(_ title: String, _ handler: ((SwalResult) -> Void)? = nil) -> Self {
        titleText(title).fire(handler)
    }
    
    @discardableResult
    public static func fire(_ title: String, _ text: String, _ icon: SwalIcon, _ handler: ((SwalResult) -> Void)? = nil) -> Self {
        Self().fire(title, text, icon, handler)
    }
    
    @discardableResult
    public func fire(_ title: String, _ text: String, _ icon: SwalIcon, _ handler: ((SwalResult) -> Void)? = nil) -> Self {
        titleText(title).text(text).icon(icon).fire(handler)
    }
    
    @discardableResult
    public static func fire(_ handler: ((SwalResult) -> Void)? = nil) -> Self {
        Self().fire(handler)
    }
    
    @discardableResult
    public func fire(_ handler: ((SwalResult) -> Void)? = nil) -> Self {
        options["willOpen"] = JSOneshotClosure { args in
            guard let jsValue = args.first else { return .undefined }
            if let content = self.titleContent, let div = WebApp.shared.document.querySelector("#swifweb-swal-title") {
                BaseContentElement(div.domElement).body(content: content)
            }
            if let content = self.htmlContent, let div = WebApp.shared.document.querySelector("#swifweb-swal-html") {
                BaseContentElement(div.domElement).body(content: content)
            }
            if let content = self.iconContent, let div = WebApp.shared.document.querySelector("#swifweb-swal-icon") {
                BaseContentElement(div.domElement).body(content: content)
            }
            if let content = self.loaderContent, let div = WebApp.shared.document.querySelector("#swifweb-swal-loader") {
                BaseContentElement(div.domElement).body(content: content)
            }
            if let content = self.closeContent, let div = WebApp.shared.document.querySelector("#swifweb-swal-close") {
                BaseContentElement(div.domElement).body(content: content)
            }
            if let content = self.footerContent, let div = WebApp.shared.document.querySelector("#swifweb-swal-footer") {
                BaseContentElement(div.domElement).body(content: content)
            }
            for handler in self.willOpenHandlers {
                handler(BaseElement(jsValue))
            }
            return .undefined
        }
        options["willClose"] = JSOneshotClosure { args in
            guard let jsValue = args.first else { return .undefined }
            let el = BaseElement(jsValue)
            for handler in self.willCloseHandlers {
                handler(el)
            }
            #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
            for closure in self.closures {
                closure.release()
            }
            #endif
            return .undefined
        }
        options["showClass"] = showClasses.jsValue
        options["hideClass"] = hideClasses.jsValue
        if let promise = JSObject.global.Swal.function?.fire.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: [options.jsValue]
        )?.jsValue {
            promise.then.function?.callAsFunction(optionalThis: promise.object, JSOneshotClosure({ args in
                var dismissReason: DismissReason?
                if let v = args.first?.dismiss.jsValue.string, let r = DismissReason(rawValue: v) {
                    dismissReason = r
                }
                handler?(.init(
                    isConfirmed: args.first?.isConfirmed.jsValue.boolean ?? false,
                    isDenied: args.first?.isDenied.jsValue.boolean ?? false,
                    isDismissed: args.first?.isDismissed.jsValue.boolean ?? false,
                    dismiss: dismissReason,
                    value: args.first?.value ?? JSValue.undefined
                ))
                return .undefined
            }))
        }
        return self
    }
    
    @discardableResult
    public func fire() async -> SwalResult {
        return await withCheckedContinuation { continuation in
            self.fire {
                continuation.resume(returning: $0)
            }
        }
    }
    
// WON'T SUPPORT
//    @discardableResult
//    public func mixin() -> Self {
//        JSObject.global.Swal.function?.mixin.function?.callAsFunction(
//            optionalThis: JSObject.global.Swal.function,
//            arguments: [options.jsValue]
//        )
//        return self
//    }
    
    /// Determine if popup is shown.
    public static var isVisible: Bool {
        JSObject.global.Swal.function?.isVisible.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )?.jsValue.boolean ?? false
    }
    
    /// Close the currently open SweetAlert2 popup programmatically.
    public static func close() {
        JSObject.global.Swal.function?.close.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Get the popup container which contains the backdrop and the popup itself.
    public static func getContainer() -> BaseElement {
        BaseElement(
            JSObject.global.Swal.function?.getContainer.function?.callAsFunction(
                optionalThis: JSObject.global.Swal.function,
                arguments: []
            )?.jsValue ?? .undefined
        )
    }
    
    /// Get the popup.
    public static func getPopup() -> BaseElement {
        BaseElement(
            JSObject.global.Swal.function?.getPopup.function?.callAsFunction(
                optionalThis: JSObject.global.Swal.function,
                arguments: []
            )?.jsValue ?? .undefined
        )
    }
    
    /// Enable "Confirm" and "Cancel" buttons.
    public static func enableButtons() -> Void {
        JSObject.global.Swal.function?.enableButtons.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Disable "Confirm" and "Cancel" buttons.
    public static func disableButtons() -> Void {
        JSObject.global.Swal.function?.disableButtons.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    public enum Button {
        case cancel, deny, confirm
    }
    
    /// Shows loader (spinner), this is useful with AJAX requests.
    public static func showLoading(_ button: Button = .confirm) -> Void {
        switch button {
        case .confirm:
            JSObject.global.Swal.function?.showLoading.function?.callAsFunction(
                optionalThis: JSObject.global.Swal.function,
                arguments: []
            )
        case .cancel:
            JSObject.global.Swal.function?.showLoading.function?.callAsFunction(
                optionalThis: JSObject.global.Swal.function,
                arguments: [
                    JSObject.global.Swal.function?.getCancelButton.function?.callAsFunction(
                        optionalThis: JSObject.global.Swal.function,
                        arguments: []
                    )
                ]
            )
        case .deny:
            JSObject.global.Swal.function?.showLoading.function?.callAsFunction(
                optionalThis: JSObject.global.Swal.function,
                arguments: [
                    JSObject.global.Swal.function?.getDenyButton.function?.callAsFunction(
                        optionalThis: JSObject.global.Swal.function,
                        arguments: []
                    )
                ]
            )
        }
    }
    
    /// Hides loader and shows back the button which was hidden by .showLoading()
    public static func hideLoading() -> Void {
        JSObject.global.Swal.function?.hideLoading.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Determine if popup is in the loading state.
    /// Related methods: Swal.showLoading() and Swal.hideLoading()
    public static func isLoading() -> Bool {
        JSObject.global.Swal.function?.isLoading.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )?.jsValue.boolean ?? false
    }
    
    /// Returns the time left in case when timer parameter is set.
    public static func getTimerLeft() -> Double {
        let value = JSObject.global.Swal.function?.getTimerLeft.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )?.jsValue.number ?? 0
        if value > 0 {
            return value / 1_000
        }
        return 0
    }
    
    /// Stops the timer in case when timer parameter is set. Returns the time left
    public static func stopTimer() -> Void {
        JSObject.global.Swal.function?.stopTimer.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Resume the timer previously stopped. Returns the time left
    public static func resumeTimer() -> Void {
        JSObject.global.Swal.function?.resumeTimer.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Toggle state of the timer between stopped and running. Returns the time left
    public static func toggleTimer() -> Double {
        JSObject.global.Swal.function?.toggleTimer.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )?.jsValue.number ?? 0
    }
    
    /// Toggle state of the timer between stopped and running. Returns the time left
    public static func isTimerRunning() -> Bool {
        JSObject.global.Swal.function?.isTimerRunning.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )?.jsValue.boolean ?? false
    }
    
    /// Increase the timer by **n** seconds. Returns the time left
    public static func increaseTimer(_ value: Double) -> Double {
        JSObject.global.Swal.function?.increaseTimer.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: [value.jsValue]
        )?.jsValue.number ?? 0
    }
    
    /// Click the "Confirm"-button programmatically.
    public static func clickConfirm() -> Void {
        JSObject.global.Swal.function?.clickConfirm.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Click the "Deny"-button programmatically.
    public static func clickDeny() -> Void {
        JSObject.global.Swal.function?.clickDeny.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Click the "Cancel"-button programmatically.
    public static func clickCancel() -> Void {
        JSObject.global.Swal.function?.clickCancel.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Disable input. A disabled input element is unusable and un-clickable.
    public static func disableInput() -> Void {
        JSObject.global.Swal.function?.disableInput.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Enable input.
    public static func enableInput() -> Void {
        JSObject.global.Swal.function?.enableInput.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Show the validation message DOM node.
    public static func showValidationMessage(_ message: String) -> Void {
        JSObject.global.Swal.function?.showValidationMessage.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: [message.jsValue]
        )
    }
    
    /// Hide the validation message DOM node.
    public static func resetValidationMessage() -> Void {
        JSObject.global.Swal.function?.resetValidationMessage.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )
    }
    
    /// Get the validation message DOM node.
    public static func getValidationMessage() -> String {
        JSObject.global.Swal.function?.getValidationMessage.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: []
        )?.jsValue.string ?? ""
    }
    
    /// Determine if parameter name is valid.
    public static func isValidParameter(_ param: String) -> Bool {
        JSObject.global.Swal.function?.isValidParameter.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: [param.jsValue]
        )?.jsValue.boolean ?? false
    }
    
    /// Determine if parameter name is valid for Swal.update() method.
    public static func isUpdatableParameter(_ param: String) -> Bool {
        JSObject.global.Swal.function?.isUpdatableParameter.function?.callAsFunction(
            optionalThis: JSObject.global.Swal.function,
            arguments: [param.jsValue]
        )?.jsValue.boolean ?? false
    }
}

public enum SwalGrow: String {
    case row
    case column
    case fullscreen
}

public enum SwalPosition: String {
    case top
    case topStart = "top-start"
    case topEnd = "top-end"
    case center
    case centerStart = "center-start"
    case centerEnd = "center-end"
    case bottom
    case bottomStart = "bottom-start"
    case bottomEnd = "bottom-end"
}

public enum SwalInputType: String {
    case text
    case email
    case password
    case number
    case tel
    case range
    case textarea
    case select
    case radio
    case checkbox
    case file
    case url
}

public struct SwalIcon: ExpressibleByStringLiteral {
    let value: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
    
    public static var warning: Self { "warning" }
    public static var error: Self { "error" }
    public static var success: Self { "success" }
    public static var info: Self { "info" }
    public static var question: Self { "question" }
}

public struct SweetAlertTheme: ExpressibleByStringLiteral {
    let value: String
    
    public init(stringLiteral value: String) {
        self.value = value
    }
    
    public static var wordpressAdmin: Self { "wordpress-admin" }
    public static var dark: Self { "swal-dark" }
    public static var bootstrap4: Self { "swal-bootstrap-4" }
    public static var minimal: Self { "swal-minimal" }
    public static var bulma: Self { "swal-bulma" }
    public static var materialUI: Self { "swal-material-ui" }
    public static var borderless: Self { "swal-borderless" }
    public static var `default`: Self { "swal-default" }
}
