package laba3;

public class Laba3 {
    public static void main(String[] args) {
        System.out.println("колледж");
        College aviac = new College();
        aviac.TeahersNum(68);
        aviac.studentNum(335);

        System.out.println("\nУниверситет");
        University Politech = new University();
        Politech.TeahersNum(200);
        Politech.studentNum(7881);
        Politech.faculty(8);
    }
    
}
