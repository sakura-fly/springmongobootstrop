import com.alibaba.fastjson.JSONObject;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Base64;

import static java.lang.System.out;

/**
 * Created by lw on 17-1-11.
 */
public class test {

    public static void main(String[] args) throws ProtocolException {

        String res = "qiEAAP///////////////////7w=";
        byte[] b_test1;
        b_test1 = Base64.getDecoder().decode(res);
        StringBuilder sb = new StringBuilder(b_test1.length);
        for (byte bc : b_test1) {
            sb.append(String.format("%02X", bc));
        }
        System.out.println(sb.toString());
//        String res;
//        comm_http ch = new comm_http();
//        res = ch.sendPost(constants.pubkeyurl,"");
//
//        System.out.print(res);
//
//        org.json.JSONObject js = new  org.json.JSONObject(res);
//        System.out.print(js.get("pukey"));

//        String add_url = "http://lo:8080/sdea/obdctl/register";
//        URL url = null;
//        try {
//            url = new URL(add_url);
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        }
//        HttpURLConnection connection = null;
//        try {
//            connection = (HttpURLConnection)url.openConnection();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        connection.setDoInput(true);
//        connection.setDoOutput(true);
//        connection.setRequestMethod("POST");
//        connection.setUseCaches(false);
//        connection.setInstanceFollowRedirects(true);
//        connection.setRequestProperty("Content-Type","application/json");
//        try {
//            connection.connect();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        DataOutputStream out = null;
//        try {
//            out = new DataOutputStream(connection.getOutputStream());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        JSONObject obj = new JSONObject();
//
//        obj.put("code", -1002);
//        obj.put("message", "msg");
//        try {
//            out.writeBytes(obj.toString());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            out.flush();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            out.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

    }
}
