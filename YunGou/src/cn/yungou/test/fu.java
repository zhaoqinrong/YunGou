package cn.yungou.test;

public class fu {
    private String a="fua";
    String b="fub";
   public  static String c="fustaticc";
    private static String d="funprivatestaticd";

    public fu() {
        System.out.println(this);
    }

    public void test(){
        System.out.println("fusout");
        System.out.println(this);
    }
}
