/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import javax.swing.JFormattedTextField;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author Admin
 */
public class UtilitiesHelper {

    public static boolean checkNull(JTextField c, String m) {
        if (c.getText().trim().isEmpty()) {
            DialogHelper.alert(c, m + " can not be empty!");
            c.requestFocus();
            return true;
        }
        return false;
    }

    public static boolean checkNull(JTextArea c, String m) {
        if (c.getText().trim().isEmpty()) {
            DialogHelper.alert(c, m + " can not be empty!");
            c.requestFocus();
            return true;
        }
        return false;
    }

    public static boolean checkNull(JFormattedTextField c, String m) {
        if (c.getText().trim().isEmpty()) {
            DialogHelper.alert(c, m);
            c.requestFocus();
            return true;
        }
        return false;
    }

    public static boolean checkPattern(JTextField c, String m) {
        if (c.getText().matches(m)) {
            DialogHelper.alert(c, m);
            c.requestFocus();
            return true;
        }
        return false;
    }

    public static boolean checkNumber(JTextField c, String m, double... a) {
        try {
            double so = Double.parseDouble(c.getText());
            if (a.length > 0 && so < a[0]) {
                DialogHelper.alert(c, m + " không nhỏ hơn " + a[0]);
                c.requestFocus();
                return true;
            } else if (a.length > 1 && so > a[1]) {
                DialogHelper.alert(c, m + " không lớn hơn " + a[1]);
                c.requestFocus();
                return true;
            }
        } catch (NumberFormatException e) {
            DialogHelper.alert(c, m + " phải là số!");
            return true;
        }
        return false;
    }

    public static boolean checkNumber(JTextField c, String m, int... a) {
        try {
            int so = Integer.parseInt(c.getText());
            if (a.length > 0 && so < a[0]) {
                DialogHelper.alert(c, m + " không nhỏ hơn " + a[0]);
                c.requestFocus();
                return true;
            } else if (a.length > 1 && so > a[1]) {
                DialogHelper.alert(c, m + " không lớn hơn " + a[1]);
                c.requestFocus();
                return true;
            }
        } catch (NumberFormatException e) {
            DialogHelper.alert(c, m + " phải là số thực!");
            return true;
        }
        return false;
    }

    public static boolean checkDate(JTextField c, String m) {
        try {
            DateHelper.toDate(c.getText());
            return true;
        } catch (NumberFormatException e) {
            DialogHelper.alert(c, "Ngày tháng sai định dạng");
            c.requestFocus();
            return false;
        }
    }

    public static boolean checkSize(JTextField c, int s) {
        if (c.getText().length() < s) {
            DialogHelper.alert(c, "Tối thiểu " + s + " kí tự!");
            c.requestFocus();
            return true;
        }
        return false;
    }

    public static boolean checkSize(JPasswordField c, int s) {
        if (new String(c.getPassword()).length() < s) {
            DialogHelper.alert(c, "password is at least " + s + " characters");
            c.requestFocus();
            return true;
        }
        return false;
    }

    public static boolean checkEmail(JTextField c) {
        if (!c.getText().matches("\\w+@\\w+(\\.\\w+){1,2}")) {
            DialogHelper.alert(c, "Invalid email address!");
            c.requestFocus();
            return false;
        }
        return true;
    }

    public static boolean checkPhone(JTextField c) {
        if (!c.getText().matches("0\\d{9}")) {
            DialogHelper.alert(c, "Invalid phone number!");
            c.requestFocus();
            return false;
        }
        return true;
    }

    public static boolean checkPrice(JTextField a) {
        try {
            double number = Double.parseDouble(a.getText().trim());
            if (number <= 0) {
                DialogHelper.alert(null, "Price must be higher than 0");
                a.requestFocus();
                return false;
            }
            return true;
        } catch (Exception e) {
            DialogHelper.alert(null, "Wrong number format");
            a.requestFocus();
            return false;
        }
    }

    public static boolean checkIsAlphabet(JTextField txt, String mess) {
        if (!txt.getText().trim().matches("^[a-zA-Z\\s\\p{L}]+")) {
            DialogHelper.alert(txt, mess + " contains only alphabet characters and white space characters");
            txt.requestFocus();
            return false;
        }
        return true;
    }

    public static boolean checkNumber(JTextField txt) {
        if (!txt.getText().matches("-?\\d+(.\\d+)?")) {
            DialogHelper.alert(txt, "This must be number!");
            txt.requestFocus();
            return true;
        }
        return false;
    }

}//CLASS
