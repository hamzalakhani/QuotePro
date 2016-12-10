//
//  ViewController.swift
//  QuotePro
//
//  Created by Hamza Lakhani on 2016-12-07.
//  Copyright © 2016 Hamza Lakhani. All rights reserved.
//

import UIKit
protocol AddItemDelegate {
    func didSave(quote:Quotes)
}

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var imageRandom: UIImageView!
    @IBOutlet weak var quoteRandom: UILabel!
    @IBOutlet weak var newQuote: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var newImage: UIButton!
    
    var randomImage : UIImage?
    
    var addItemDelegate: AddItemDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let dataTask = session.dataTask(with: url!, completionHandler: {(data: Data?, resp: URLResponse?, err: Error?) in
            
            if let error = err {
                
                print(error.localizedDescription)
            }
            
    
            var quoteSearch = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:String]
            let quote = quoteSearch["quoteText"];
            let author = quoteSearch["quoteAuthor"]
//            print(quote ?? "error unwrapping")
            
            DispatchQueue.main.async {

                self.quoteRandom.text = quote
                self.quoteAuthor.text = author
            }
            

        })
        dataTask.resume()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    func callQuotes() {
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let dataTask = session.dataTask(with: url!, completionHandler: {(data: Data?, resp: URLResponse?, err: Error?) in
            
            if let error = err {
                
                print(error.localizedDescription)
            }
            
            
            var quoteSearch = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:String]
            let quote = quoteSearch["quoteText"];
            let author = quoteSearch["quoteAuthor"]
            //            print(quote ?? "error unwrapping")
            DispatchQueue.main.async {

            self.quoteRandom.text = quote
            self.quoteAuthor.text = author
            }
        })
        dataTask.resume()

        
    }

    func callImages() {
        let url = URL(string: "http://lorempixel.com/400/200/")
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let dataTask = session.dataTask(with: url!, completionHandler: {(data: Data?, resp: URLResponse?, err: Error?) in
            
            if let error = err {
                
                print(error.localizedDescription)
            }
            //add the view to the main thread
            DispatchQueue.main.async {

            if let  data = data {
            self.randomImage = UIImage(data: data)
            self.imageRandom.image = self.randomImage
            }
            }
        })
        dataTask.resume()
    }

    @IBAction func newQuote(_ sender: Any) {
        callQuotes()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newImage(_ sender: Any) {
        callImages()
    }
    
    @IBAction func saveContent(_ sender: Any) {
        let quotes = Quotes(quoteText: quoteRandom.text!, quoteAuthor: quoteAuthor.text!, randomImage: imageRandom.image!)
        self.addItemDelegate?.didSave(quote:quotes)
        self.navigationController?.popViewController(animated: true)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
