package com.dbal.app.emp;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EmpVO {
    @JsonProperty(value = "id") 
    String employeeId;
    
	String firstName;
	String lastName;
	String email;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH")
	Date hireDate;   //LocalDateTime  , Date
	
	@JsonIgnore 
	String jobId;
	
	@JsonIgnore 
	String departmentId;
	
	@JsonIgnore 
	Integer salary;
	
	@JsonIgnore 
	Integer[] employeeIds;
}
