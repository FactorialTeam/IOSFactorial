import UIKit
protocol AuthCoordinatorDelegate:class {
    func coordinatorDidAuthenticate(coordinator:Coordinator)
}
final class AuthCoordinator: BaseCoordinator {
    
    private unowned var delegate:AuthCoordinatorDelegate
    private let router: AppRouter
    private let factory: AuthModuleFactory
    private var navController: UINavigationController
    
    init(router: AppRouter, delegate: AuthCoordinatorDelegate, factory: AuthModuleFactory ) {
        self.router = router
        self.delegate = delegate
        self.factory = factory
        self.navController = UINavigationController.defaultNavController()
    }
    
    override func start() {
        showInitialViewController()
    }
    
    //MARK: - Run current flow's controllers
    private func showLogin() {
        let loginVC = factory.makeSignInViewController(delegate: self)
        let navVC = loginVC.embedInNavigationController()
        navVC.navigationBar.isHidden = false
        self.navController.present(navVC, animated: true, completion: nil)
    }
    
    private func showSignUp() {
        let signUpVC = factory.makeSignUpViewController(delegate: self)
        let navVC = signUpVC.embedInNavigationController()
        navVC.navigationBar.isHidden = false
        self.navController.present(navVC, animated: true, completion: nil)
    }
    
    private func showInitialViewController() {
        let initialVC = factory.makeInitialViewController()
        initialVC.delegate = self
        self.navController.viewControllers = [initialVC]
        self.navController.navigationBar.isHidden = true
        self.router.setRootModule(self.navController)
    }
}

//MARK: SignInViewControllerDelegate
extension AuthCoordinator: SignInViewControllerDelegate {
    func didSuccessfullyLogin() {
        self.delegate.coordinatorDidAuthenticate(coordinator: self)
    }
}

//MARK: SignInViewControllerDelegate
extension AuthCoordinator: SignUpViewControllerDelegate {
    func didSuccessfullySignUp() {
        self.delegate.coordinatorDidAuthenticate(coordinator: self)
    }
}

//MARK: InitialViewControllerDelegate
extension AuthCoordinator: InitialViewControllerDelegate {
    func didCompleteAutoLogin() {
         self.delegate.coordinatorDidAuthenticate(coordinator: self)
    }

    
    func didTapSigninButton() {
        showLogin()
    }
    
    func didTapSignUpButton() {
        showSignUp()
    }
    
}

