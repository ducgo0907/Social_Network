/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import constant.IConstant;

/**
 *
 * @author ngoqu
 */
public class Helper {

    public static String checkInformationRegister(
            String username,
            String email,
            String password
    ) {
        String errors = "";
        if (username.isEmpty()) {
            errors += "User name is not empty <br/>";
        }
        if (email.isEmpty()) {
            errors += "Email is not empty <br/>";
        }
        if (!email.matches(IConstant.REGEX_EMAIL)) {
            errors += "Email is must the correct format (name@something.com) <br/>";
        }
        if (password.length() < 6){
            errors += "Password is must greater than six characters <br/>";
        }
        return errors;
    }
    
    public static String checkPassword(
            String oldPassword,
            String correctPassword,
            String newPassword,
            String confirmPassword,
            int minLength,
            int maxLength
    ){
        String errors = "";
        
        if(!oldPassword.equals(correctPassword)){
            errors += "Current password is not correct! <br/>";
        }
        
        if(newPassword.isEmpty()){
            errors += "New password should not be empty! <br/>";
        }
        
        if(!newPassword.equals(confirmPassword)){
            errors += "New password must match with confirm password <br/>";
        }
        
        if(newPassword.length() < minLength || newPassword.length() > maxLength){
            errors += "Password must be greater than " + minLength + " and less"
                    + "than " + maxLength + " characters <br/>";
        }
        
        return errors;
    }
    
}
