/**
*  
*   
*   
*/	

package com.how2java.tmall.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Enumeration;
import java.util.EventListener;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;
import javax.servlet.SessionCookieConfig;
import javax.servlet.SessionTrackingMode;
import javax.servlet.descriptor.JspConfigDescriptor;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.ProductImage;
import com.how2java.tmall.service.ProductImageService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.util.ImageUtil;
import com.how2java.tmall.util.Page;
import com.how2java.tmall.util.UploadedImageFile;


@Controller
@RequestMapping("")
public class ProductImageController {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
    ProductService productService;

    @Autowired
    ProductImageService productImageService;


    /**
     * 增加图片的方法
     * @param pi
     * @param session
     * @param uploadedImageFile
     * @return
     */
    @RequestMapping("admin_productImage_add")
    public String add(ProductImage  pi, HttpSession session, UploadedImageFile uploadedImageFile ) {
        productImageService.add(pi);
        String fileName = pi.getId()+ ".jpg";
        String imageFolder;
        String imageFolder_small=null;
        String imageFolder_middle=null;
        if(ProductImageService.type_single.equals(pi.getType())){
        	imageFolder= session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productSingle"/* session.getServletContext().getRealPath("img/productSingle");*//*session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH_productSingle")*/ ;   //                            this.getServletConfig().getServletContext().getRealPath("/productSingle");
            imageFolder_small= session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productSingle_small";/*session.getServletContext().getRealPath("img/productSingle_small");*//*session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH_productSingle_small");*/         //this.getServletConfig().getServletContext().getRealPath("/productSingle_small"); 
            imageFolder_middle = session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productSingle_middle"; /*session.getServletContext().getRealPath("img/productSingle_middle");*//*session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH_productSingle_middle");*/      //this.getServletConfig().getServletContext().getRealPath("/productSingle_middle"); 
        }
        else{
            imageFolder=session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productDetail" /*session.getServletContext().getRealPath("img/productDetail")*/;
        }

        File f = new File(imageFolder, fileName);
        f.getParentFile().mkdirs();
        try {
            uploadedImageFile.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img, "jpg", f);

            if(ProductImageService.type_single.equals(pi.getType())) {
                File f_small = new File(imageFolder_small, fileName);
                File f_middle = new File(imageFolder_middle, fileName);

                ImageUtil.resizeImage(f, 56, 56, f_small);
                ImageUtil.resizeImage(f, 217, 190, f_middle);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:admin_productImage_list?pid="+pi.getPid();
    }

    /**
     * 删除图片的方法
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("admin_productImage_delete")
    public String delete(int id,HttpSession session) {
        ProductImage pi = productImageService.get(id);

        String fileName = pi.getId()+ ".jpg";
        String imageFolder;
        String imageFolder_small=null;
        String imageFolder_middle=null;
        if(ProductImageService.type_single.equals(pi.getType())){
        	imageFolder= session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productSingle"; /*session.getServletContext().getRealPath("img/productSingle")*//*session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH_productSingle");*/     //this.getServletConfig().getServletContext().getRealPath("/productSingle");
            imageFolder_small= session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productSingle_small"; /*session.getServletContext().getRealPath("img/productSingle_small")*//*session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH_productSingle_small");*/  //this.getServletConfig().getServletContext().getRealPath("/productSingle_small"); 
            imageFolder_middle= session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productSingle_middle";/*session.getServletContext().getRealPath("img/productSingle_middle")*//*session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH_productSingle_middle");*/ //this.getServletConfig().getServletContext().getRealPath("/productSingle_middle"); 
            File imageFile = new File(imageFolder,fileName);
            File f_small = new File(imageFolder_small,fileName);
            File f_middle = new File(imageFolder_middle,fileName);
            imageFile.delete();
            f_small.delete();
            f_middle.delete();

        }
        else{
            imageFolder= session.getServletContext().getInitParameter("UPLOAD_IMAGE_PATH")+"productDetail"; /*session.getServletContext().getRealPath("img/productDetail");*/
            File imageFile = new File(imageFolder,fileName);
            imageFile.delete();
        }


        productImageService.delete(id);


        return "redirect:admin_productImage_list?pid="+pi.getPid();
    }

    /**
     * 
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping("admin_productImage_list")
    public String list(int pid, Model model) {
        Product p =productService.get(pid);
        List<ProductImage> pisSingle = productImageService.list(pid, ProductImageService.type_single);
        List<ProductImage> pisDetail = productImageService.list(pid, ProductImageService.type_detail);
        model.addAttribute("p", p);
        model.addAttribute("pisSingle", pisSingle);
        model.addAttribute("pisDetail", pisDetail);

        return "admin/listProductImage";
    }

}
