package org.apache.commons.io;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
//import java.io.OutputStream;
public class IOUtils {
	public static byte[] toByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }
        return output.toByteArray();
    }
}
