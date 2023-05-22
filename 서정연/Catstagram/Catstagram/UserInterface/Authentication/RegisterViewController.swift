//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/03/28.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    // 유효성 검사를 위한 Property
    
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    // 구조체로 구조화
    
    
    var isValidEmail = false {
        // property observer : 데이터 기준으로 동작, 값이 입력될 때마다 method 호출
        didSet{
            self.validateUserInfo()
        }
    }
    var isValidName = false{
        didSet{
            self.validateUserInfo()
        }
    }
    var isValidNickname = false{
        didSet{
            self.validateUserInfo()
        }
    }
    var isValidPassword = false{
        didSet{
            self.validateUserInfo()
        }
    }
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var returnToLoginButton: UIButton!
    // 연산 property
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, pwdTextField]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setUpAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil

        // Do any additional setup after loading the view.
    }
    
    // MARK: - LifeCycle
    
    // MARK: - Actions
    // 코드로 구성
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender{
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case pwdTextField:
            self.isValidPassword = text.isValidPwd()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
        
    }
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 뒤로가기 로직
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func ergisterButtonDidTap(_ sender: UIButton) {
        // 뒤로가기 로직
        self.navigationController?.popViewController(animated: true)
        
        // 데이터 전달
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    
    
    // MARK: - Helpers
    // TF와 action 연결
    // 이벤트가 오게되면 누가 처리할거냐
    private func setupTextField(){
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validateUserInfo(){
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            
            self.signUpButton.isEnabled = true
            // 애니메이션 추가
            UIView.animate(withDuration: 0.33) {
                self.signUpButton.backgroundColor = UIColor(named: "FacebookColor")
            }
            
        }else{
            // 유효성 검사 false
            self.signUpButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signUpButton.backgroundColor = UIColor(named: "disabledButtonColor")
            }
        }
        
    }
    
    private func setUpAttribute(){
        // registerButton
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        // let color2 = UIColor(named: "FacebookColor")
        let color2 = UIColor.blue
        
        let attributes = self.generateButtonAttribute(
            returnToLoginButton,
            texts: text1, text2,
            fonts: font1,font2,
            colors: color1, color2)
        
        // 적용하기
        self.returnToLoginButton.setAttributedTitle(attributes, for: .normal)
        
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// 정규표현식
// 기능확장

extension String{
    // 대문자, 소문자, 특수문자, 숫자 8자리 이상 => TRUE
    func isValidPwd() -> Bool{
        let regularExtension = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExtension)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @포함, 2글자 이상인지
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
}


//extension UIColor {
//    static let FacebookColor = UIColor(named: "FacebookColor")
//    class var disabledButtonColor: UIColor? { return UIColor(named: "disabledButtonColor") }
//}
