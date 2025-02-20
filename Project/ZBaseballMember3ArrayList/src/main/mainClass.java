package main;

import java.util.Scanner;

import dao.MemberDao;

public class mainClass {

	public static void main(String[] args) {	
		Scanner sc = new Scanner(System.in);
		
		MemberDao dao = new MemberDao();
				
		// menu 구성	== front end -> View
		while(true) {
			
			System.out.println("1. 선수 등록 ");
			System.out.println("2. 선수 삭제 ");
			System.out.println("3. 선수 검색 ");
			System.out.println("4. 선수 수정 ");
			System.out.println("5. 선수 모두 출력 ");
			
			System.out.println("6. 데이터 저장 ");
			
			System.out.println("7. 방어율 Ranking ");
			System.out.println("8. 타율 Ranking ");
			
			System.out.println("10. 프로그램 종료 ");
			
			System.out.print("메뉴 번호 입력 >>> ");
			int choice = sc.nextInt();
			
			switch( choice ) {
				case 1:
					dao.insert();
					break;
				case 2:
					dao.delete();
					break;
				case 3:
					dao.select();
					break;
				case 4:
					dao.update();
					break;
				case 5:
					dao.allprint();
					break;					
				case 6:
					dao.saveData();
					break;
				case 7:
					break;
				case 8:
					dao.batterHitRanking();
					break;
										
				case 10:
					System.out.println("프로그램을 종료합니다");
					System.exit(0);					
					break;			
			}			
		}		
		
	}

}