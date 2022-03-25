//: [Previous](@previous)

import UIKit

//You have 4 ways total to delay. Out of these option 1 is preferable to call or execute a function after some time. The sleep() is least case in use.



class MyClass:UIViewController {
    
    override func viewDidLoad() {
        //Option 1.
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            self.yourFuncHere()
            //code
        }
       
        //Option 2.
        perform(#selector(yourFuncHere2(_:)), with: nil, afterDelay: 5.0)

        
        //Option 3.
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(yourFuncHere3), userInfo: nil, repeats: false)
        

        //Option 4.
        sleep(5)
        
        //If you want to call a function after some time to execute something don't use sleep.

    }
    
    //Your function here
    @objc func yourFuncHere() {
      print("this is first option")
    }
    //Your function here
    @objc func yourFuncHere2(_ text:String) {
        print("this is second option")
    }
    //Your function here
    @objc func yourFuncHere3() {
       print("this is third option")
    }
}

