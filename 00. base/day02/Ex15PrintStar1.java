package day02;

import java.util.Scanner;
public class Ex15PrintStar1 {
	//본디 2중 for loop(NestedForLoop?)와 가장 쉽게 친해지는 방법은
	//별찍기 예제가 있다.(실제업무효용성x)
	
	//1. 번호 하나당 클래스 하나가 나온다.
	//2. 모든 별찍기는 사용자로부터 입력을 받아서 입력 받은거에 맞는 줄 수가 출력된다.
	//3. 아래 예제들은 모두 사용자가 5라고 입력했을때 출력되는 모양이다.
	//4. 7~10번은 비록 9줄이 나와있지만 마찬가지로 사용자가 5라고 입력했을때 출력되는 모양이다.
	
	//
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("출력할 줄 수를 입력해주세요: ");
		int userNumber = scanner.nextInt();
		
		for(int height = 1; height <= userNumber; height++) {
			String stars = "";
			for(int width = 1; width <= height; width++) {
				stars += "*";
			}
			
			System.out.println(stars);
		}
		
		scanner.close();
	}
}
//" "; 공백