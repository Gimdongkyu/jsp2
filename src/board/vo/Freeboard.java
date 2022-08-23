package board.vo;

import java.sql.Timestamp;

public class Freeboard {
	private int idx;
	private String writer;
	private String password;
	private String subject;
	private String content;
	private int readCount;
	private Timestamp wdate;
	private String ip;
	private int commentCount;
	
	
	public Freeboard(int idx,String writer,String password,
			String subject, String content,int readCount,Timestamp wdate,
			String ip, int commentCount) {
		this.idx=idx;
		this.writer=writer;
		this.password=password;
		this.subject=subject;
		this.content=content;
		this.readCount=readCount;
		this.wdate=wdate;
		this.ip=ip;
		this.commentCount=commentCount;
		
		
	}

	public Freeboard() {
		
	}
	
	@Override
	public String toString() {
		return "Freeboard [idx=" + idx + ", writer=" + writer + ", password=" + password + ", subject=" + subject
				+ ", content=" + content + ", readCount=" + readCount + ", wdate=" + wdate + ", ip=" + ip
				+ ", commentCount=" + commentCount + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	
	
}
