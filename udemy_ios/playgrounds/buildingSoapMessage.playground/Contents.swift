//: Playground - noun: a place where people can play

import UIKit

var soapMessage = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:dev=\"http://xmlns.oracle.com/bpm/bpmobject/MobileData/DeviceRegistrationReq\">"
+"<soapenv:Header>"
+"<wsse:Security soapenv:mustUnderstand=\"1\" xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\" xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\">"
+"<wsse:UsernameToken wsu:Id=\"UsernameToken-1\">"
+"<wsse:Username>swapprover</wsse:Username>"
+"<wsse:Password Type=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText\">CeDYqSU8RHeAoWbBhGbL</wsse:Password>"
+"</wsse:UsernameToken>"
@"</wsse:Security>"
@"</soapenv:Header>"
@"<soapenv:Body>"
@"<dev:DeviceRegistrationRequest>"
@"<dev:DeviceRegistrationRequest>"
@"<dev:password>%@</dev:password>"
@"<dev:deviceToken>%@</dev:deviceToken>"
@"<dev:deviceName>%@</dev:deviceName>"
@"</dev:DeviceRegistrationRequest>"
@"</soapenv:Body>"
@"</soapenv:Envelope>";



println(soapMessage)


