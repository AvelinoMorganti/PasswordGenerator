package classes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class passwordGenerator {

    private final String numbers = "0123456789";
    private final String alphanumeric = "0123456789abcdefghijklmnopqrstuvwxyz";
    private final String strong = "0123456789!@#$%¨&*()+-_{}[];:.,~^`´|<>?abcdefghijklmnopqrstuvwxyz";

    private final String symbols = "!@#$%¨&*()+-_{}[];:.,~^`´|<>?";
    private final String letters = "abcdefghijklmnopqrstuvwxyz";

    public static void main(String args[]) {
        System.out.println(shuffleString("082DCFzhqXUsXrsjbCQqo|%,$__<#|<"));
        String a = "abcdef";
        System.out.println(a.length());

        System.out.println(shuffle(a));
    }

    public static String shuffle(String s) {
        List<String> letters = Arrays.asList(s.split(""));
        Collections.shuffle(letters);
        StringBuilder t = new StringBuilder(s.length());
        for (String k : letters) {
            t.append(k);
        }
        return t.toString();
    }

    public static String shuffle2(String str) {
        List<String> strs = Arrays.asList(str.split(""));
        Collections.shuffle(strs);
        String ret = "";
        for (String s : strs) {
            ret += s;
        }
        return ret;
    }

    public static String shuffleString(String s) {
        List<String> letters = new ArrayList<String>();

        for (int i = 0; i < s.length(); i++) {
            letters.add(String.valueOf(s.charAt(i)));
        }

        Collections.shuffle(letters);
        String temp = "";

        for (int i = 0; i < s.length(); i++) {
            temp += letters.get(i);
        }

        return temp;
    }

    public String passwordGenerator(int passwordLenght, String type) {
        String password = "";

        //Obtem letras de a até z
        if (type.equals("LOWER_CASE_LETTERS")) {
            for (int i = 0; i < passwordLenght; i++) {
                password += getRandomLetterCharacter(false);
            }
            password.toLowerCase();
        }

        if (type.equals("UPPER_CASE_LETTERS")) {
            for (int i = 0; i < passwordLenght; i++) {
                password += getRandomLetterCharacter(false);
            }
            password.toUpperCase();
        }

        //Obtém letras de a até z e/ou A até Z
        if (type.equals("RANDOM_CASE_LETTERS")) {
            for (int i = 0; i < passwordLenght; i++) {
                password += getRandomLetterCharacter(true);
            }
        }

        //Obtém números de 0 a 9
        if (type.equals("NUMBERS")) {
            for (int i = 0; i < passwordLenght; i++) {
                password += getRandomNumericCharacter();
            }
        }

        if (type.equals("SYMBOLS")) {
            for (int i = 0; i < passwordLenght; i++) {
                password += getRandomSymbolCharacter();
            }
        }

        if (type.equals("ALPHANUMERIC")) {
            for (int i = 0; i < passwordLenght; i++) {
                String s = "";
                s += getRandomAlphanumericCharacter();
                int a = (int) (Math.random() * 2);
                if (a == 0) {
                    s = s.toUpperCase();
                } else {
                    s = s.toLowerCase();
                }
                password += s;
            }
        }

        if (type.equals("STRONG")) {
            for (int i = 0; i < passwordLenght; i++) {
                String s = "";
                s += getRandomStrongCharacter();
                int a = (int) (Math.random() * 2);
                if (a == 0) {
                    s = s.toUpperCase();
                } else {
                    s = s.toLowerCase();
                }
                password += s;
            }
        }
        /*
         Quero fazer uma função para balancear a quantidade de números, letras e símbolos
        
         Por exemplo, o usuário pode setar a porcentagem de números
        
         0.2 numbers
         0.6 letters
         0.2 symbols
         _____
         1.0
       
         20 tamanho
         4 numeros
         12 letras
         4 símbolos
        
        
         */
        return password;
    }

    //numbers 0 to 9
    protected char getRandomNumericCharacter() {
        int random = ((int) (Math.random() * (numbers.length())));
        return numbers.charAt(random);
    }

    //numbers 0 to 9 or letters a to z
    protected char getRandomAlphanumericCharacter() {
        int random = ((int) (Math.random() * (numbers.length() + letters.length())));
        return alphanumeric.charAt(random);
    }

    //numbers 0 to 9 or letters a to z or symbols
    protected char getRandomStrongCharacter() {
        int random = ((int) (Math.random() * (numbers.length() + letters.length() + symbols.length())));//numbers 0 to 9 or 
        return strong.charAt(random);
    }

    //symbols
    protected char getRandomSymbolCharacter() {
        int random = ((int) (Math.random() * (symbols.length())));
        return symbols.charAt(random);
    }

    //letters a to z or A to Z
    protected char getRandomLetterCharacter(boolean random_case) {
        int random = ((int) (Math.random() * (letters.length())));

        if (random_case) {
            int a = (int) (Math.random() * 2);
            String s = "";

            if (a == 0) {
                s += letters.charAt(random);
                return s.toUpperCase().charAt(0);
            } else {
                s += letters.charAt(random);
                return s.toLowerCase().charAt(0);
            }
        }
        return letters.charAt(random);
    }

    protected int getProbability(int tamanho, String type) {
        return 0;
    }
}
