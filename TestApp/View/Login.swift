import SwiftUI
import AuthenticationServices

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image("bg2")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.50))
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Home Finder")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 30, content: {
                    Text("Find Your Home")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("The internet source of realities all over the world")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                })
                .padding(.horizontal, 30)
                
                Spacer()
                
                SignInWithAppleButton { (request) in
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email, .fullName]
                    request.nonce = sha256(loginData.nonce)
                } onCompletion: { (result) in
                    switch result {
                        case .success(let user):
                            print("success")
                            
                            guard let credential = user.credential as?
                                    ASAuthorizationAppleIDCredential else {
                                print("error firebase")
                                return
                            }
                            
                            loginData.authenticate(credential: credential)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }.signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .clipShape(Capsule())
                .padding(.horizontal, 40)
                .offset(y: -70)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
