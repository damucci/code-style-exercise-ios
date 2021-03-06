//
//  ColorsViewController.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/14/16.
//
//

import UIKit

class ColorsViewController : UIViewController, UICollectionViewDataSource, UITextFieldDelegate
{

    class constants {
        static let DFLTNUMCOLORS:Int=12
    }

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var colorCountTextField: UITextField!

    var ct: Int? = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")

        self.colorCountTextField.placeholder = "12"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Collection View Data Source Methods

    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section : Int) -> Int{
        return ct!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var c = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorsCollectionViewCell
//        let color = UIColor.random
//        c.backgroundColor = color
//        c.hexColorLbl.text = color.description
        c.configureCellWithColor(color: random_ui_color())
        return c
    }




    //////////////////////////////////
    // MARK: - UITextFieldDelegate ///
    //////////////////////////////////

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count>0{
            if (textField.text! as NSString).replacingCharacters(in: range, with: string).characters.count <= 2 {
                var str = string.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined() // Filters string by removing non-decimal digits
                return string == str
            } else {
                return false
            }
        }
        else {
            return true
        }
    }



    // MARK: - IBActions

    // This IBAction is called when the user taps on the background view
    // It makes the colorsCountTextField resign first responder and sets colors count to the int value of the colorsCountTextField text
    @IBAction func userDidTapOnTheBackgroundView(_ sender: UITapGestureRecognizer) {
        colorCountTextField.resignFirstResponder()
        ct = Int(colorCountTextField.text ?? "")
    }

    @IBAction func btnPressed(_ sender: Any) {
    collectionView.reloadData()
    }

    public func random_ui_color() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))/255
        let green = CGFloat(arc4random_uniform(256))/255
        let blue = CGFloat(arc4random_uniform(256))/255
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}



