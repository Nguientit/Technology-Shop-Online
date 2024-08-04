package util;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormatter {
    //phuong thuc de dinh dang gia tri float thanh chuoi tien te 
    public static String formatCurrency(float value) {
        NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        return formatter.format(value);
    }
}
