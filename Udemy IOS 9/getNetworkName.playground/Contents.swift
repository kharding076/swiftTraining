//: Playground - noun: a place where people can play

import UIKit




var ssidName: String {
    return CWWiFiClient()?.interfaceWithName(nil)?.ssid() ?? ""
}