package org.ks.recipe;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import org.ks.member.vo.Member;
import org.ks.recipe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
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
    public String recipePage(HttpServletRequest request, Model model){
        String q = request.getParameter("q");
        String cat1 = request.getParameter("cat1");
        String cat2 = request.getParameter("cat2");
        String order = request.getParameter("order");
        String page = request.getParameter("page");
        RecipeSearch recipeSearch = new RecipeSearch();
        recipeSearch.setQ(q == null ? "" : q);
        recipeSearch.setCat1(cat1 == null ? "" : cat1);
        recipeSearch.setCat2(cat2 == null ? "" : cat2);
        recipeSearch.setOrder(order == null ? "" : order);
        int pageNum;
        try {
            pageNum = Integer.parseInt(page);
        }catch (Exception e){
            pageNum = 1;
        }
        recipeSearch.setPage(pageNum);
        List<Category> categoryList = recipeService.categoryList();
        model.addAttribute("categoryList",categoryList);
        PageData<Recipe> recipePageData = recipeService.recipeList(recipeSearch);
        model.addAttribute("recipeList", recipePageData.getList());
        model.addAttribute("recipeSearch", recipeSearch);
        model.addAttribute("pageNav",recipePageData.getPageNav());
        return "recipe/recipeList";
    }

    @RequestMapping("/recipeRegPage.do")
    public String recipeRegPage(HttpServletRequest request, Model model) {
        if(request.getSession(false)==null || request.getSession(false).getAttribute("member") ==null){
            request.setAttribute("msg","로그인 후에 사용할수 있습니다.");
            request.setAttribute("loc","/loginPage.do");
            return "common/msg";
        }
        List<Category> categoryList = recipeService.categoryList();
        String recipeNo = request.getParameter("recipeNo");
        if(recipeNo!=null){
            RecipeDetail recipeDetail = recipeService.getRecipeDetail(recipeNo);
            String memberId = ((Member)request.getSession(false).getAttribute("member")).getId();
            if(!memberId.equals(recipeDetail.getMember().getId())){
                request.setAttribute("msg","권한이 없습니다.");
                request.setAttribute("loc","/recipeRegPage.do");
                return "common/msg";
            }else {
                model.addAttribute("recipeDetail",recipeDetail);
                System.out.println(recipeDetail.getRecipe().toString());
            }
        }
        model.addAttribute("categoryList", categoryList);
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
        String cat1 = multi.getParameter("cok_sq_category_1");
        String cat2 = multi.getParameter("cok_sq_category_2");
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


//        StringBuffer recipeStep = new StringBuffer();
//        StringBuffer recipeStepImg = new StringBuffer();
//        StringBuffer recipeWorkImg = new StringBuffer();
//        String deli = "<:>";
        List<Step> recipeStep = new ArrayList<Step>();
        List<String> recipeWorkImg = new ArrayList<String>();
        //step text
//        for(int i = 0;i<steps.length;i++){
//            if(i==0){
//                recipeStep.append(steps[i]);
//            } else {
//                recipeStep.append(deli);
//                recipeStep.append(steps[i]);
//            }
//            recipeStep.add(new Step(steps[i],""));
//        }


        Iterator <String> files = multi.getFileNames();

        while(files.hasNext()){

            String uploadFile = files.next();
            System.out.println("uploadFile Name : " + uploadFile);

            List<MultipartFile> mFile = multi.getFiles(uploadFile);
            int i=0;
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
//                    recipeStepImg.append(deli);
//                    recipeStepImg.append(newFileName);
                    recipeStep.add(new Step(steps[i++],newFileName));
                }else if(uploadFile.trim().equals("work_photo[]")&&fileName.trim().length() > 0){
//                    if(recipeWorkImg.toString().trim().length()<=0){
//                        recipeWorkImg.append(newFileName);
//                    }else {
//                        recipeWorkImg.append(deli);
//                        recipeWorkImg.append(newFileName);
//                    }
                    recipeWorkImg.add(newFileName);
                }

            }
        }
        Recipe recipe = new Recipe(0,title,member.getId(),contents,mainImg,cat1,cat2,count,time,level,item,recipeStep,0,0,0,null,0,recipeWorkImg,video, Integer.parseInt(recipeState));
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

    @RequestMapping(value = "/recipeUnLike", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String recipeUnLike(@RequestParam(value = "recipeNo") String recipeNo, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        Like like = new Like(Integer.parseInt(recipeNo),member.getId());
        boolean result = recipeService.recipeUnLike(like);
        String message="";
        if(result){
            message = "좋아요가 취소되었습니다.";
        }else {
            message = "취소 실패";
        }

        return message;
    }

    @RequestMapping(value = "/orderRegPage.do")
    public String orderRegPage(Model model){
        List<Category> categoryList = recipeService.categoryList();
        model.addAttribute("categoryList",categoryList);
        List<Recipe> recipeList = recipeService.likeRank();
        model.addAttribute("recipeList",recipeList);
        return "admin/recipe/orderReg";
    }
    @RequestMapping(value = "/orderPage.do")
    public String orderPage(Model model){
        List<Recipe> recipeList = recipeService.product();
        model.addAttribute("recipeList",recipeList);
        return "admin/recipe/orderModify";
    }

    @RequestMapping(value = "/orderReg.do",produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String orderReg(String recipeNo,String price){
        String message;
        int result = recipeService.orderReg(Integer.parseInt(recipeNo),Integer.parseInt(price));
        if(result>0){
            message = "성공적으로 등록되었습니다.";
        }else{
            message = "가격등록에 실패했습니다.";
        }
        return message;
    }

    @RequestMapping(value = "/myRecipe.do")
    public String myRecipe(HttpSession session, Model model, String page){
        Member member = (Member) session.getAttribute("member");
        String id = member.getId();
        System.out.println(id);
        RecipeSearch recipeSearch = new RecipeSearch();
        recipeSearch.setId(id);
        recipeSearch.setPage(page);
        System.out.println(recipeSearch.getId());
        PageData<Recipe> recipePageData = recipeService.MyRecipeList(recipeSearch);
        model.addAttribute("recipeList", recipePageData.getList());
        model.addAttribute("pageNav",recipePageData.getPageNav());
        return "member/myRecipe";
    }

    @RequestMapping(value = "/recipeDel.do", method = RequestMethod.POST)
    public String recipeDel(HttpServletRequest request){
        String recipeNo = request.getParameter("recipe_no");
        String state = request.getParameter("recipe_state");
        Recipe recipe = new Recipe();
        recipe.setRecipeNo(Integer.parseInt(recipeNo));
        recipe.setRecipeState(Integer.parseInt(state));
        int result = recipeService.recipeDel(recipe);
        return "recipe/recipe";
    }

    @RequestMapping(value = "recipeUpdate.do", method = RequestMethod.POST)
    public String recipeUpdate(MultipartHttpServletRequest multi, HttpSession session){
        Member member = (Member) session.getAttribute("member");

        String recipeNo = multi.getParameter("recipe_no");
        String item = multi.getParameter("cok_material");
        String time = multi.getParameter("cok_time");
        String count =  multi.getParameter("cok_portion");
        String contents = multi.getParameter("cok_intro");
        String video = multi.getParameter("cok_video_url");
        String level = multi.getParameter("cok_degree");
        String title = multi.getParameter("cok_title");
        String cat1 = multi.getParameter("cok_sq_category_1");
        String cat2 = multi.getParameter("cok_sq_category_2");
        String mainImg = multi.getParameter("recipeMainImg");

        String recipeState = multi.getParameter("recipe_state");
        String[] steps = multi.getParameterValues("steps");

        String originMainImg = multi.getParameter("origin_main_img");
        String newMainImg = multi.getParameter("new_main_img");
        String delMainImg = multi.getParameter("del_main_img");

        String [] originStepImg = multi.getParameterValues("origin_step_img");
        String [] newStepImg = multi.getParameterValues("new_step_img");
        String [] delStepImg = multi.getParameterValues("del_step_img");

        String [] originWorkImg = multi.getParameterValues("origin_work_img");
        String [] newWorkImg = multi.getParameterValues("new_work_img");
        String [] delWorkImg = multi.getParameterValues("del_work_img");

        String [] delImg = multi.getParameterValues("delImg");

        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/recipe/";

        String newFileName = ""; // 업로드 되는 파일명

        File dir = new File(path); //파일경로 설정
        if (!dir.exists()) {
            dir.mkdirs();
        }

        List<Step> recipeStep = new ArrayList<Step>();
        List<String> recipeWorkImg = new ArrayList<String>();

        Iterator <String> files = multi.getFileNames();

        while(files.hasNext()){

            String uploadFile = files.next();
            System.out.println("uploadFile Name : " + uploadFile);

            List<MultipartFile> mFile = multi.getFiles(uploadFile);
            int i=0;
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
                    if(newMainImg.equals("1")) {
                        mainImg = newFileName;
                    }
                    else if(delMainImg.equals("1")) {
                        File file = new File(path+originMainImg);
                        if(file.exists()){
                            if(file.delete()){
                                System.out.println(file.toString()+"삭제성공");
                            }
                        }
                        mainImg = "";
                    }else {
                        mainImg = originMainImg;
                    }
                }else if(uploadFile.trim().equals("step_photo[]")){
                    if(newStepImg[i].equals("1")){
                        recipeStep.add(new Step(steps[i],newFileName));
                    }
                    else if(delStepImg[i].equals("1")){
                        File file = new File(path+originStepImg[i]);
                        if(file.exists()){
                            if(file.delete()){
                                System.out.println(file.toString()+"삭제성공");
                            }
                            recipeStep.add(new Step(steps[i],""));
                        }
                    } else {
                        recipeStep.add(new Step(steps[i],originStepImg[i]));
                    }
                    i++;
                }else if(uploadFile.trim().equals("work_photo[]")){
                    if(newWorkImg[i].equals("1")){
                        recipeWorkImg.add(newFileName);
                    }
                    else if(delWorkImg[i].equals("1")){
                        File file = new File(path+originWorkImg[i]);
                        if(file.exists()){
                            if(file.delete()){
                                System.out.println(file.toString()+"삭제성공");
                            }
                            recipeWorkImg.add("");
                        }
                    } else {
                        recipeWorkImg.add(originWorkImg[i]);
                    }
                    i++;
                }

            }
        }
        Recipe recipe = new Recipe(Integer.parseInt(recipeNo),title,member.getId(),contents,mainImg,cat1,cat2,count,time,level,item,recipeStep,0,0,0,null,0,recipeWorkImg,video, Integer.parseInt(recipeState));
        System.out.println(recipe);

        int result = recipeService.recipeUpdate(recipe);

        if(delImg!=null&&delImg.length>0)
        for (String f:
             delImg) {
            File file = new File(path+f);
            if(file.exists()){
                if(file.delete()){
                    System.out.println(file.toString()+"삭제성공");
                }
            }
        }

        return "recipe/recipe";
    }
}
