
import Foundation
final class AuthModuleFactoryImp:NSObject, AuthModuleFactory {
    
    func makeSignInViewController(delegate:SignInViewControllerDelegate) -> SignInViewController {
        let signinVC = SignInViewController.controllerFromStoryboard(.login)
        signinVC.delegate = delegate
        return signinVC
    }
    
    @objc func makeInitialViewController() -> InitialViewController {
        return InitialViewController.controllerFromStoryboard(.login)
    }
    
    func makeSignUpViewController(delegate: SignUpViewControllerDelegate) -> SignUpViewController {
        let vc = SignUpViewController.controllerFromStoryboard(.login)
        vc.delegate = delegate
        return vc
    }
    
}
