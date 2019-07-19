package org.ks.recipe.vo;

public class Step {
    private String step;

    private String img;

    @Override
    public String toString() {
        return "Step{" +
                "step='" + step + '\'' +
                ", img='" + img + '\'' +
                '}';
    }

    public Step() {
    }

    public Step(String step, String img) {
        this.step = step;
        this.img = img;
    }

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
