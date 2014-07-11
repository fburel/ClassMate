//
//  LoginViewController.m
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import "LoginViewController.h"
#import "ConnectionManager.h"
#import "User.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)connect:(id)sender
{
    NSString * login = self.loginTextField.text;
    NSString * password = self.passwordTextField.text;
    
    ConnectionManager * manager = [ConnectionManager sharedInstance];
    
    [manager performLoginWithUserName:login
                          andPassword:password
                           completion:^(BOOL success, NSString *userID)
    {
        if(!success)
        {
            self.passwordTextField.text = @"";
            
            UIAlertView * alert = [UIAlertView new];
            alert.title = @"Mauvais login / mot de passe";
            alert.message = @"Essaye encore";
            [alert addButtonWithTitle:@"OK"];
            [alert show];
        }
        else
        {
            User * user = [User sharedInstance];
            user.userName = self.loginTextField.text;
            user.identifer = userID;
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
    }];
}


@end
