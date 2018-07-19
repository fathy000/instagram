
import UIKit
import Firebase
import FirebaseAuth

class CommentEditViewController: UIViewController {
    
    var postData:PostData!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func commentSendButton(_ sender: Any) {
        
        
        
        print( "DEBUG_PRINT: commentSendButtonがタップされました" )
        print(Const.PostPath)
        print(postData.id!)
        let postRef = Database.database().reference().child(Const.PostPath).child((postData?.id!)!)
        let name = Auth.auth().currentUser?.displayName
        postData.comments.append("\(name!) : \(commentTextField.text!)")
        let comments = [ "comments":postData.comments ]
        postRef.updateChildValues(comments)
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func commentCancelButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
