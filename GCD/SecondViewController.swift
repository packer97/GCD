import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBAction func getBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
    }
    
    func showImage() {
            activityIndicator.startAnimating()
            let url = URL(string: "https://i.kym-cdn.com/photos/images/facebook/001/564/773/6cf.jpg")!
            
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                        self.activityIndicator.stopAnimating()
                    }
                }
            }
        }
    }

