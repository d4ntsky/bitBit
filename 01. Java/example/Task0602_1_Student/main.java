package Task0602_1_Student;

public class main {
	public static void main(String args[]) {

		Student s = new Student(); // student를 눌러 생성
		s.name = "홍길동";
		s.ban = 1;
		s.no = 1;
		s.kor = 100;
		s.eng = 60;
		s.math = 76;
		System.out.println("이름:" + s.getName());
		System.out.println("총점:" + s.getTotal(s.kor,s.eng,s.math));
		System.out.println("평균:" + s.getAverage());

	}
}