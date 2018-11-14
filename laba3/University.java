package laba3;

public class University extends College{
    
    public void faculty(int a){
        System.out.println("\tФакультеты " + a);
    };
    @Override
    public void studentNum(int a){
        System.out.println("\tСтуденты " + a);
    };
    public void TeahersNum(int a){
        System.out.println("\tПреподовалели " + a);
    };        
    
}
