
import Foundation
import MMDrawerController
final class BaseModulFactoryImp:NSObject, BaseModulFactory {
    
    func makeDrawerController(center: UIViewController, leftDrawerViewController: UIViewController) -> MMDrawerController {
        let drawerController =  MMDrawerController(center: center, leftDrawerViewController: leftDrawerViewController)!
        drawerController.showsShadow = false
        drawerController.restorationIdentifier = "MMDrawer"
        drawerController.maximumLeftDrawerWidth = 230
        drawerController.openDrawerGestureModeMask = .all
        drawerController.closeDrawerGestureModeMask = .all
        
        drawerController.setDrawerVisualStateBlock { (drawer, drawerSide, percentVisible) in
            if let block = MMDrawerVisualState.parallaxVisualStateBlock(withParallaxFactor: 2.0) {
                block(drawerController, drawerSide, percentVisible);
            }
        }
        return drawerController
    }
    
    func makeHomeViewController() -> HomeViewController {
        let vc = HomeViewController.controllerFromStoryboard(.main)
        return vc
    }
    
    func makeFolderViewController() -> FolderViewController {
        let vc = FolderViewController.controllerFromStoryboard(.main)
        return vc
    }
    
    func makeMenuViewController(delegate: MenuViewControllerDelegate) -> MenuViewController {
        let vc = MenuViewController.controllerFromStoryboard(.main)
        vc.delegate = delegate
        return vc
        
    }
    
    func makeGenerateViewController() -> GenerateViewController {
        let vc = GenerateViewController.controllerFromStoryboard(.main)
        return vc
    }
    
    func makeFileListViewController(folderId: Int) -> FileListViewController {
        let vc = FileListViewController.controllerFromStoryboard(.main)
        vc.folderId = folderId
        return vc
    }
    
    func makeQuestionsViewController(file: FileModel) -> QuestionsViewController {
        let vc = QuestionsViewController.controllerFromStoryboard(.main)
        vc.file = file
        return vc
    }
    
    func makeSaveQuestionViewController(file: FileModel) -> SaveQuestionViewController {
        let vc = SaveQuestionViewController.controllerFromStoryboard(.main)
        vc.file = file
        return vc
    }
    
    func makeTextAnalysisViewController(text: String) -> TextAnalysisViewController {
        let vc = TextAnalysisViewController.controllerFromStoryboard(.main)
        vc.text = text
        return vc
    }
    
    func makeCameraViewController() -> CameraViewController {
        let vc = CameraViewController.controllerFromStoryboard(.main)
        return vc
    }
    
}

