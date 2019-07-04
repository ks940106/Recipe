package org.ks.recipe;

import net.sf.json.JSONObject;
import org.ks.recipe.vo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.io.File;
import java.util.Iterator;
import java.util.List;

@Controller
public class RecipeController {

    @Autowired
    @Qualifier(value = "recipeServiceImpl")
    RecipeService recipeService;



    @RequestMapping("/recipePage.do")
    public String recipePage(Model model){
        List<Category> categories = recipeService.categoryList();
        model.addAttribute("categories",categories);
        return "recipe/recipe";
    }
    @RequestMapping(value = "/recipeReg.do", method = RequestMethod.POST, produces = "text/plain")
    public String recipeReg(MultipartHttpServletRequest multi) throws Exception{
        String[] array = multi.getParameterValues("array");
        for (String s:
             array) {
            System.out.println(s);
        }
        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/";

        String newFileName = ""; // 업로드 되는 파일명

        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }

        Iterator <String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
            System.out.println("uploadFile : " + uploadFile);

            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);

            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

//        System.out.println("id : " + multi.getParameter("id"));
//        System.out.println("pw : " + multi.getParameter("pw"));

        return "recipe/recipe";
    }
}
