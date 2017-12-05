
import UIKit

class MessageSocketManager: SESocketRequestBaseManager {

    static let shared = MessageSocketManager()
    
    // 具体某个模块中的请求
    func updateGroupList(parameter: Dictionary<String, Any>,
                           success: @escaping SocketSuccessCompletionHandle,
                           failure: SocketFailureCompletionHandle) -> Void {
        commManager.request(parameter: parameter,
                            identifier: "",
                            requestApi: "imserver/groupList",
                            requestType: SocketRequestType.CmdTypeLocFuncRequest.rawValue,
                            timeOut: 30,
                            resend: true) { (obj, err, other) in
                                success(obj, obj)
                                
        }
    }
}
