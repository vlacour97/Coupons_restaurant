//
//  ViewController.swift
//  CouponsiOS
//
//  Created by Valentin Lacour on 08/06/2016.
//  Copyright © 2016 Level Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sum = [0.0,0.0];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeDesignMenu();
        for obj in view_menu.subviews
        {
            if(obj.tag == 11){
                print(obj);
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeDesignMenu(){
        let amount = UILabel()
        amount.text = "0";
        amount.textAlignment = NSTextAlignment.Right;
        amount.tag = 11;
        amount.frame = CGRectMake(0, 0, 200, 21);
        amount.targetForAction("showTotal:", withSender: self)
        view_menu.addSubview(amount)
        
    }
    
    func showTotal(){
        lbl_total.text = "Total : " + String(calcTotal()) + "€";
    }
    
    @IBAction func changeMenu(sender: UIStepper) {
        let value = Int(sender.value);
        lbl_amount_menu.text = String(value);
        sum[0] = Double(value * lbl_menu.tag);
        showTotal();
    }
    
    func calcTotal()->Double{
        var total = 0.0;
        for value in sum {
            total += value;
        }
        return total;
    }
    
    @IBAction func change_bonus_value(sender: UITextField) {
        var value = 0.0;
        do
        {
            value = try Double(sender.text!)!;
        }
        catch _
        {
            value = 0.0;
        }
        sum[sum.count - 1] = value;
        showTotal()
    }

    @IBOutlet weak var lbl_id: UILabel!
    @IBOutlet weak var view_menu: UIView!
    @IBOutlet weak var lbl_menu: UILabel!
    @IBOutlet weak var stepr_menu: UIStepper!
    @IBOutlet weak var lbl_amount_menu: UILabel!
    @IBOutlet weak var lbl_total: UILabel!

}

