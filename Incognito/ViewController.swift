/// Copyright (c) 2017 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import OAuthSwift

class ViewController: UIViewController {
  
  // MARK: - Private properties
  @IBOutlet weak var idnumber: UILabel!
  @IBOutlet weak var scSegmented: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  var Scenario = "666666666"
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    imageView.image = #imageLiteral(resourceName: "1308570_203522.jpg")
    idnumber.text = "Scenario: \(Scenario)"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func segmented(_ sender: Any) {
    let getIndex = scSegmented.selectedSegmentIndex
    switch (getIndex) {
    case 0:
      Scenario = "666666666"
      idnumber.text = "Scenario: \(Scenario)"
      imageView.image = #imageLiteral(resourceName: "1308570_203522.jpg")
    case 1:
      Scenario = "777777777"
      idnumber.text = "Scenario: \(Scenario)"
      imageView.image = #imageLiteral(resourceName: "0c5b69f231486fb94ac15fb5d30584bf.jpg")
    case 2:
      Scenario = "555555555"
      idnumber.text = "Scenario: \(Scenario)"
      imageView.image = #imageLiteral(resourceName: "terrorist-automatic-gun-white-background-arab-nationality-camouflage-suit-keffiyeh-reflection-31071451.jpg")
    default:
      Scenario = "666666666"
      idnumber.text = "Scenario: \(Scenario)"
      imageView.image = #imageLiteral(resourceName: "1308570_203522.jpg")
    }
  }
  
  private func presentAlert(_ title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sendmessage(_ sender: UIButton) {
    let oauthswift = OAuth2Swift(
      consumerKey:    "cd31ac26943e47bfacb65bd5dfdb68fa",
      consumerSecret: "bef46d0cc1b158396a427b7d14a8d272",
      authorizeUrl:   "https://api-sandbox.capitalone.com/oauth2/auth",
      accessTokenUrl: "https://api-sandbox.capitalone.com/oauth2/token",
      responseType:   "code"
    )
    oauthswift.allowMissingStateCheck = true

    oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
    
  }
  
}
