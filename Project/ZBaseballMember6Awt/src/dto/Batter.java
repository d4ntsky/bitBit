package dto;

public class Batter extends Human {

	private int batcount;
	private int hit;
	private double hitAvg;
	
	public Batter() {
	}

	public Batter(int number, String name, int age, double height, int batcount, int hit, double hitAvg) {
		super(number, name, age, height);
		this.batcount = batcount;
		this.hit = hit;
		this.hitAvg = hitAvg;
	}

	public int getBatcount() {
		return batcount;
	}

	public void setBatcount(int batcount) {
		this.batcount = batcount;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public double getHitAvg() {
		return hitAvg;
	}

	public void setHitAvg(double hitAvg) {
		this.hitAvg = hitAvg;
	}
	
	@Override
	public void infomation() {
		// TODO Auto-generated method stub
		super.infomation();		
		System.out.println("타율:" + hitAvg);
	}

	@Override
	public String toString() {
		return super.toString() + "-" + batcount + "-" + hit + "-" + hitAvg;
	}
	
}