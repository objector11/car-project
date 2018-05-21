package cn.lnj.project.car.util;

import javax.servlet.http.HttpServlet;
import java.io.*;

/**
 * @author 刘乃杰
 * on 2018/5/11 15:30
 */
public class Count extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Count() {
        super();
    }

    public static void writeFile(String filename, int count) {

        try {
            PrintWriter out = new PrintWriter(new FileWriter(filename));
            out.println(count);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static int readFile(String filename) {
        File f = new File(filename);
        int count = 0;
        if (!f.exists()) {
            writeFile(filename, 0);
        }
        try {
            BufferedReader in = new BufferedReader(new FileReader(f));
            try {
                count = Integer.parseInt(in.readLine());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return count;
    }

}
