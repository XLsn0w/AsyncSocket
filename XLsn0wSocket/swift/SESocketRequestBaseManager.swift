
import UIKit

typealias SocketSuccessCompletionHandle = (_ object: Any, _ other: Any) ->()
typealias SocketFailureCompletionHandle = (_ error: Any, _ other: Any) ->()

class SESocketRequestBaseManager: NSObject {
    let commManager = SESocketCommManager.instance

    // 样例
    func subApp(parameter: Dictionary<String, Any>, success: SocketSuccessCompletionHandle, failure: SocketFailureCompletionHandle) -> Void {
        commManager .request(parameter: parameter,
                             identifier: "",
                             requestApi: "application/subApp",
                             requestType: SocketRequestType.CmdTypeLongDistanceFuncRequest.rawValue,
                             timeOut: 30,
                             resend: true) { (obj, err, oth) in
            
        }
    }
}
