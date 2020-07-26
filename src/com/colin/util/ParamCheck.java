package com.colin.util;

public class ParamCheck {
    public static boolean ParamCheck(String... inputs) {
        for (String input : inputs
        ) {
            if (null == input || "".equals(input)) {
                return false;
            }
        }
        return true;
    }
}
