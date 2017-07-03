package com.my.zipcode;

public class Member {
	 	
		private String mid;
		private String password;
		private String email;
		private String phone;
	    private String jibunAddress; // 주소
	    private String roadAddress;
	    private String postcode; // 우편번호
	    private String birth;
	    private String admin;
		public String getMid() {
			return mid;
		}
		public void setMid(String mid) {
			this.mid = mid;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getJibunAddress() {
			return jibunAddress;
		}
		public void setJibunAddress(String jibunAddress) {
			this.jibunAddress = jibunAddress;
		}
		public String getRoadAddress() {
			return roadAddress;
		}
		public void setRoadAddress(String roadAddress) {
			this.roadAddress = roadAddress;
		}
		public String getPostcode() {
			return postcode;
		}
		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}
		public String getBirth() {
			return birth;
		}
		public void setBirth(String birth) {
			this.birth = birth;
		}
		public String getAdmin() {
			return admin;
		}
		public void setAdmin(String admin) {
			this.admin = admin;
		}
	  
}
