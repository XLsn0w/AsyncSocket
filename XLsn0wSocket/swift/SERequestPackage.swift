
import UIKit

class SERequestPackage: NSObject {
   
    var body: Dictionary<String, Any> = [:]
    var identifier: String = ""
    var timeOut: TimeInterval = 30
    var resend: Bool = false
    var requestApi: String = ""
    
    var requestType: SocketRequestType = .CmdTypeLocFuncRequest
    
}
