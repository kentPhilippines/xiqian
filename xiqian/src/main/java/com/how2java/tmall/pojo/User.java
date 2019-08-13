/**
*  
*   
*   
*/	

package com.how2java.tmall.pojo;

public class User {
    private Integer id;
    private String name;
    private String nameId;
    private String password;
    
    public String getNameId() {
		return nameId;
	}
	public void setNameId(String nameId) {
		this.nameId = nameId;
	}
	public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAnonymousName(){
        if(null==name)
            return null;

        if(name.length()<=1)
            return "*";

        if(name.length()==2)
            return name.substring(0,1) +"*";

        char[] cs =name.toCharArray();
        for (int i = 1; i < cs.length-1; i++) {
            cs[i]='*';
        }
        return new String(cs);


    }
}
/**
*  
*   
*   
*/	
