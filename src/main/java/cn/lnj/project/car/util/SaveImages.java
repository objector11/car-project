package cn.lnj.project.car.util;


import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


/**
 * 将图片存储到项目的skin/images 文件夹中，
 * 数据库中存储图片的名称
 * 多个图片名称用","连接
 */

@Service
public class SaveImages {

    /**
     * 存储图片
     * @param images 图片
     * content.getOriginalFilename() 获得图片上传时的名称
     *  StringTest path = System.getProperty("user.dir")+"/src/main/webapp/skins/images"; 保存路径
     */
    public String saveImages(MultipartFile[] images, String imagesName,HttpServletRequest request){
        StringBuffer stringBuffer=new StringBuffer();
        //存储路径
        String path=request.getSession().getServletContext().getRealPath("skins/images");
        for (int i=0;i<images.length;i++){
            if( !"".equals(images[i].getOriginalFilename()) && images[i].getOriginalFilename() !=null && images[i].getOriginalFilename().length()>0){
                File targetFile =new File(path,imagesName+i+".png");
                stringBuffer.append(imagesName+i+".png,");
                if(!targetFile.exists()){
                    targetFile.mkdir();
                }
                //保存
                try {
                    images[i].transferTo(targetFile);
                } catch (IOException e) {
                    System.out.println("转换出错");
                    e.printStackTrace();
                }
            }
        }
        String result = stringBuffer.substring(0,stringBuffer.length()-1);
        return result;
    }



    public void saveImage(MultipartFile image,String imageName,HttpServletRequest request){
        String path=request.getSession().getServletContext().getRealPath("skins/images");
        if( !"".equals(image.getOriginalFilename()) && image.getOriginalFilename() !=null && image.getOriginalFilename().length()>0){
            File targetFile =new File(path,imageName+".png");
            if(!targetFile.exists()){
                targetFile.mkdir();
            }
            //保存
            try {
                image.transferTo(targetFile);
            } catch (IOException e) {
                System.out.println("转换出错");
                e.printStackTrace();
            }
        }
    }

}
