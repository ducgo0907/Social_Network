package utils;

import java.util.Scanner;

public class Validate {

    private final static Scanner SCANNER = new Scanner(System.in);

    /**
     *
     */
    private Validate() {
    }

    /**
     * Get input integer.
     *
     * @param messageInfo
     * @param errorOutOfRange
     * @param errorNumberFormat
     * @param min
     * @param max
     * @return
     */
    public static int getInputInteger(
            String messageInfo,
            String errorOutOfRange,
            String errorNumberFormat,
            int min,
            int max
    ) {
        do {
            try {
                System.out.println(messageInfo);
                int number = Integer.parseInt(SCANNER.nextLine());
                if (number >= min && number <= max) {
                    return number;
                }
                System.out.println(errorOutOfRange);
            } catch (NumberFormatException exception) {
                System.out.println(errorNumberFormat);
            }
        } while (true);
    }

    /**
     * Get String with regex.
     *
     * @param messageInfo
     * @param messageError
     * @param REGEX
     * @return
     */
    public static String getString(
            String messageInfo,
            String messageError,
            final String REGEX
    ) {
        do {
            System.out.println(messageInfo);
            String str = SCANNER.nextLine();
            if (str.matches(REGEX)) {
                return str;
            }
            System.out.println(messageError);
        } while (true);
    }

}
