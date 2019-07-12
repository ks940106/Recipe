package org.ks.recipe;

import org.ks.member.vo.Member;
import org.ks.recipe.vo.Category;
import org.ks.recipe.vo.Like;
import org.ks.recipe.vo.Recipe;
import org.ks.recipe.vo.RecipeDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
public class RecipeController {

    @Autowired
    @Qualifier(value = "recipeServiceImpl")
    RecipeService recipeService;

    @RequestMapping("/recipePage.do")
    public String recipePage(Model model){
        List<Category> categoryList = recipeService.categoryList();
        model.addAttribute("categoryList",categoryList);
        List<Recipe> recipeList = recipeService.recipeList();
        model.addAttribute("recipeList",recipeList);
        return "recipe/recipeList";
    }

    @RequestMapping("/recipeRegPage.do")
    public String recipeRegPage(Model model) {
        List<Category> categoryList = recipeService.categoryList();
        model.addAttribute("categoryList",categoryList);
        return "recipe/recipe";
    }

    @RequestMapping(value = "/recipeReg.do", method = RequestMethod.POST)
    public String recipeReg(HttpSession session, MultipartHttpServletRequest multi) throws Exception{

        Member member = (Member) session.getAttribute("member");
        String item = multi.getParameter("cok_material");
        String time = multi.getParameter("cok_time");
//        String[] steps = multi.getParameterValues("step_text[]");
        String count =  multi.getParameter("cok_portion");
        String contents = multi.getParameter("cok_intro");
        String video = multi.getParameter("cok_video_url");
        String level = multi.getParameter("cok_degree");
        String title = multi.getParameter("cok_title");
        String cat1 = multi.getParameter("cok_sq_category_2");
        String cat2 = multi.getParameter("cok_sq_category_1");
        //step_no[]
        String mainImg = multi.getParameter("recipeMainImg");
        String[] stepPhotos = multi.getParameterValues("step_photo[]");
        String[] workPhotos = multi.getParameterValues("work_photo[]");

        System.out.println("Recipe Reg start!!!");

        String recipeState = multi.getParameter("recipe_state");
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


        StringBuffer recipeStep = new StringBuffer();
        StringBuffer recipeStepImg = new StringBuffer();
        StringBuffer recipeWorkImg = new StringBuffer();
        String deli = "<:>";

        //step text
        for(int i = 0;i<steps.length;i++){
            System.out.println("steps"+"["+i+"] : "+steps[i]);
            if(i==0){
                recipeStep.append(steps[i]);
            } else {
                recipeStep.append(deli);
                recipeStep.append(steps[i]);
            }
        }


        Iterator <String> files = multi.getFileNames();

        while(files.hasNext()){

            String uploadFile = files.next();
            System.out.println("uploadFile Name : " + uploadFile);

            List<MultipartFile> mFile = multi.getFiles(uploadFile);

            for (MultipartFile m : mFile) {
                newFileName = "";
                String fileName = m.getOriginalFilename();
                System.out.println("OriginalFilename : " + fileName);

                //file upload
                if(fileName.trim().length() > 0) {
                    UUID uuid = UUID.randomUUID();
                    //업로드할 파일이 존재할때 fileName.substring(0,fileName.indexOf("."))+
                    newFileName = uuid.toString() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
                    try {
                        m.transferTo(new File(path + newFileName));
                        System.out.println("File upload complete");
                        System.out.println(path + newFileName);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                //file path
                if(uploadFile.trim().equals("recipeMainImg")){
                    mainImg = newFileName;
                }else if(uploadFile.trim().equals("step_photo[]")){
                    recipeStepImg.append(deli);
                    recipeStepImg.append(newFileName);
                }else if(uploadFile.trim().equals("work_photo[]")&&fileName.trim().length() > 0){
                    if(recipeWorkImg.toString().trim().length()<=0){
                        recipeWorkImg.append(newFileName);
                    }else {
                        recipeWorkImg.append(deli);
                        recipeWorkImg.append(newFileName);
                    }
                }

            }
        }
        Recipe recipe = new Recipe(0,title,member.getId(),contents,mainImg,cat1,cat2,count,time,level,item,recipeStep.toString(),recipeStepImg.toString().substring(3),0,0,0,null,0,recipeWorkImg.toString(),video, Integer.parseInt(recipeState));
        System.out.println(recipe);

        int result = recipeService.recipeReg(recipe);

        return "recipe/recipe";
    }

    @RequestMapping(value = "/recipe/{recipeNo}")
    public String getRecipeByNo(@PathVariable("recipeNo") String recipeNo, Model model, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        Member member = new Member();
        if(session != null && session.getAttribute("member") != null){
            member = (Member) session.getAttribute("member");
        }
        RecipeDetail recipeDetail = recipeService.getRecipeDetail(recipeNo);
        recipeService.recipeHit(recipeNo);
        boolean isLiked = recipeService.getLike(recipeNo,member.getId());
        System.out.println(recipeDetail);
        model.addAttribute("recipe",recipeDetail);
        model.addAttribute("isLiked",isLiked);
        return "recipe/recipeDetail";
    }

    @RequestMapping(value = "/recipeLike", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String recipeLike(@RequestParam(value = "recipeNo") String recipeNo, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        Like like = new Like(Integer.parseInt(recipeNo),member.getId());
        boolean result = recipeService.recipeLike(like);
        String message="";
        if(result){
            message = "좋아요!";
        }else {
            message = "이미 좋아요한 글입니다.";
        }

        return message;
    }
}
