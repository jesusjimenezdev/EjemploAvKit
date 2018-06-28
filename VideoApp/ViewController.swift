import UIKit
import AVKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func videoBundle(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: "avengers", ofType: "mp4") {
            
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true) {
                video.play()
            }
            
        }else{
            print("No se encontro el archivo")
        }
    }
    
    @IBAction func videoGaleria(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        imagePicker.allowsEditing = false
        imagePicker.showsCameraControls = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let tempImage = info[UIImagePickerControllerMediaURL] as! URL
        let path = tempImage.relativePath
        self.dismiss(animated: true, completion: nil)
        UISaveVideoAtPathToSavedPhotosAlbum(path, self, nil, nil)
    }
    
}













