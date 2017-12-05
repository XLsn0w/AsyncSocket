
import UIKit

class SEMessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        //设置按钮位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        button.setTitle("按钮", for:.normal)
        button.addTarget(self, action: #selector(buttonaction), for: .touchUpInside)
        button.backgroundColor = UIColor.red
        self.view.addSubview(button)
        
        
        
    }
    @objc func buttonaction() -> Void {
        let message = MessageSocketManager.shared
        let parameter: Dictionary<String, Any> = ["eId":"10045111", "lastUpdate": 0]
        
        message.updateGroupList(parameter: parameter, success: { (obj, othor) in
            print(obj)
        }) { (error, other) in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
