package org.ks.recipe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {

    @RequestMapping("/recipePage.do")
    public String recipePage(){
        return "recipe/recipe";
    }
}
