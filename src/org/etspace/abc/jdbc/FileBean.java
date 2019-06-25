package org.etspace.abc.jdbc;

public class FileBean {
	private String filename;
	private String type;
	private String size;
	private String updateTime;
	private String location;
	private String username; 
	private String father;
	public FileBean() {
	}
	public FileBean(String filename, String updateTime, String size, String type, String location, String username,
			String father) {
		super();
		this.filename = filename;
		this.type = type;
		this.size = size;
		this.updateTime = updateTime;
		this.location = location;
		this.username = username;
		this.father = father;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFather() {
		return father;
	}

	public void setFather(String father) {
		this.father = father;
	}
	
}
