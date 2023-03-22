//
//  ViewController.swift
//  ApplePayTest
//
//  Created by Thobio Joseph on 22/03/23.
//

import UIKit
import PassKit

class ViewController: UIViewController {

    @IBOutlet weak var applePayButton: UIButton!
    
    private var request:PKPaymentRequest = {
        let request = PKPaymentRequest()
        request.merchantIdentifier = "merchant.com.webnetwork.Brandesto"
        request.supportedNetworks = [.visa,.quicPay,.masterCard,.maestro]
        request.supportedCountries = ["IN","US"]
        request.currencyCode = "INR"
        request.merchantCapabilities = .capability3DS
        request.countryCode = "IN"
        request.paymentSummaryItems = [PKPaymentSummaryItem(label: "Buying Something ", amount: 123456)]
        return request
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func applePayButtonAction(_ sender: UIButton) {
        let controller = PKPaymentAuthorizationViewController(paymentRequest: request)
        if controller != nil {
            controller!.delegate = self
            present(controller!, animated: true)
        }
    }
    
}

extension ViewController: PKPaymentAuthorizationViewControllerDelegate {
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true)
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
    }
    
    
}


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
