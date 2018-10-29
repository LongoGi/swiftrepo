//
//  ViewController.swift
//  comment2
//
//  Created by giuseppe longobardi on 21/10/2018.
//  Copyright © 2018 giuseppe longobardi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct userCommentStruct: Codable {
        var label: String
        var img: String
        
    }
    
    
    
    var sourceArray = [userCommentStruct] ()
    let propertyListEncoder = PropertyListEncoder()
    let propertyListDecoder = PropertyListDecoder()
    
//    let documentsDirectory = FileManager.default.urls(
//        for: .documentDirectory, in:
//        .userDomainMask).first!
    let archiveURL = FileManager.default.urls(
        for: .documentDirectory, in:
        .userDomainMask).first!.appendingPathComponent(
        "comments").appendingPathExtension("plist")
    
    


    
        
      

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var newCommentText: UITextView!
    @IBOutlet var newCommentButton: UIButton!
    
    
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
        
        cell.commentLabel?.text = sourceArray[indexPath.row].label
        cell.commentImg?.image=UIImage (named: sourceArray[indexPath.row].img)

       
            
        
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        changeStyleOfTextView()
        if let retrievedNotesData = try? Data(contentsOf: archiveURL),
            ((try? sourceArray = propertyListDecoder.decode(Array<userCommentStruct>.self, from:
                retrievedNotesData)) != nil) {
        }
        
       print (archiveURL)
        
    }

    func changeStyleOfTextView() {
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        newCommentText.layer.borderWidth = 0.5
        newCommentText.layer.borderColor = borderColor.cgColor
        newCommentText.layer.cornerRadius = 5.0
    }

    @IBAction func addComment(_ sender: Any) {
        sourceArray.append(userCommentStruct(label:newCommentText.text, img: "bere-caffè"))

        if let encodedNote = try? propertyListEncoder.encode(sourceArray) {
            if ((try? encodedNote.write(to: archiveURL, options: .noFileProtection)) != nil) {
            }
        }
        
        
        
 
       
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [
            NSIndexPath(row: sourceArray.count-1, section: 0) as IndexPath
            ], with: UITableView.RowAnimation.automatic)
        tableView.endUpdates()
        
        
       
    }
}

