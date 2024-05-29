//
//  DDFileBrowser+DDKitSwift.swift
//  DDFileBrowserDemo
//
//  Created by Damon on 2021/5/11.
//

import Foundation
import DDFileBrowser
import DDKitSwift

func UIImageHDBoundle(named: String?) -> UIImage? {
    guard let name = named else { return nil }
    guard let bundlePath = Bundle(for: DDKitSwift_FileBrowser.self).path(forResource: "fileBrowser-DDKitSwift", ofType: "bundle") else { return UIImage(named: name) }
    guard let bundle = Bundle(path: bundlePath) else { return UIImage(named: name) }
    return UIImage(named: name, in: bundle, compatibleWith: nil)
}

extension String{
    var ZXLocaleString: String {
        guard let bundlePath = Bundle(for: DDKitSwift_FileBrowser.self).path(forResource: "fileBrowser-DDKitSwift", ofType: "bundle") else { return NSLocalizedString(self, comment: "") }
        guard let bundle = Bundle(path: bundlePath) else { return NSLocalizedString(self, comment: "") }
        let msg = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        return msg
    }
}

open class DDKitSwift_FileBrowser: DDKitSwiftPluginProtocol {
    private var tool = DDFileBrowser.shared
    
    public var pluginIdentifier: String {
        return "com.DDKitSwift.DDKitSwift_FileBrowser"
    }

    public var pluginIcon: UIImage? {
        return UIImageHDBoundle(named: "DDFileBrowser")
    }

    public var pluginTitle: String {
        return "FileBrowser".ZXLocaleString
    }

    public var pluginType: DDKitSwiftPluginType {
        return .other
    }

    public var isRunning: Bool {
        return false
    }
    
    public func willStart() {
        DDKitSwift.hide()
    }
    
    public func start() {
        self.tool.start()
    }

    public func stop() {
        
    }
}
