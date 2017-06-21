package com.hao.app.pojo;

import java.io.Serializable;

public class Shiti implements Serializable{
	
	private static final long serialVersionUID = -3984543850705972217L;

	private Integer id;
	private Integer numb;
	private Integer flag;
    private String title;
    private String question;
    private String answer;
    private String pic;
    
    
    
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNumb() {
		return numb;
	}
	public void setNumb(Integer numb) {
		this.numb = numb;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

    
}