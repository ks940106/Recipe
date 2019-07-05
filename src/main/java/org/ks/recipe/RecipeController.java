package org.ks.recipe;

import net.sf.json.JSONObject;
import org.ks.member.vo.Member;
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

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Enumeration;
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
    public String recipeReg(HttpSession session, MultipartHttpServletRequest multi) throws Exception{

        Member member = (Member) session.getAttribute("member");
        String item = multi.getParameter("cok_material");
        String time = multi.getParameter("cok_time");
//        String[] steps = multi.getParameterValues("step_text[]");
        String count =  multi.getParameter("cok_portion");
        String contents = multi.getParameter("cok_intro");
        //String video = multi.getParameter("cok_video_url");
        String level = multi.getParameter("cok_degree");
        String title = multi.getParameter("cok_title");
        String cat1 = multi.getParameter("cok_sq_category_2");
        String cat2 = multi.getParameter("cok_sq_category_1");
        //step_no[]
        String mainImg = multi.getParameter("recipeMainImg");
        String[] stepPhotos = multi.getParameterValues("step_photo[]");
        String[] workPhotos = multi.getParameterValues("work_photo[]");

        String[] steps = multi.getParameterValues("steps");
        for (String s:
             steps) {
            System.out.println(s);
        }

        Enumeration enumeration = multi.getParameterNames();

        while (enumeration.hasMoreElements()){
            System.out.println("ParamName : " + enumeration.nextElement());
        }

        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/recipe/";

        String newFileName = ""; // 업로드 되는 파일명

        File dir = new File(path); //파일경로 설정
        if (!dir.exists()) {
            dir.mkdirs();
        }

        Iterator <String> files = multi.getFileNames();

        StringBuffer recipeStep = new StringBuffer();
        StringBuffer recipeStepImg = new StringBuffer();
        String deli = "|*|";

        for(int i = 0;i<steps.length;i++){
            if(i==0){
                recipeStep.append(steps[i]);
            } else {
                recipeStep.append(deli);
                recipeStep.append(steps[i]);
            }
        }



        while(files.hasNext()){

            String uploadFile = files.next();
//            System.out.println("uploadFile Name : " + uploadFile);

            List<MultipartFile> mFile = multi.getFiles(uploadFile);
            for (MultipartFile m : mFile) {

                String fileName = m.getOriginalFilename();

                if (fileName.trim().length() <= 0) {

                    continue;
                }

                System.out.println("OriginalFilename : " + fileName);
                newFileName = System.currentTimeMillis() + "."
                        + fileName.substring(fileName.lastIndexOf(".") + 1);
                try {
                    m.transferTo(new File(path + newFileName));
                    System.out.println("파일업로드성공");
                    System.out.println(path+newFileName);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


        }


        return "recipe/recipe";
    }
}
