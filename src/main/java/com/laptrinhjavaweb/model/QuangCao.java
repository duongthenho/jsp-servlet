package com.laptrinhjavaweb.model;

import java.sql.Blob;

public class QuangCao extends AbstractModel<QuangCao> {
	private Blob image1;
	private Blob image2;
	private Blob image3;
	public Blob getImage1() {
		return image1;
	}
	public void setImage1(Blob image1) {
		this.image1 = image1;
	}
	public Blob getImage2() {
		return image2;
	}
	public void setImage2(Blob image2) {
		this.image2 = image2;
	}
	public Blob getImage3() {
		return image3;
	}
	public void setImage3(Blob image3) {
		this.image3 = image3;
	}
	
}
