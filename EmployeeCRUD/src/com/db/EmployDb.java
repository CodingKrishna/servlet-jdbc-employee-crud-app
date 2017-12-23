package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;

import com.mysql.jdbc.ResultSet;

public class EmployDb {
	public void addEmploy(LinkedHashMap<String,String> lhm) throws SQLException, ClassNotFoundException{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empapp","root","root");
			PreparedStatement pstmt = conn.prepareStatement("insert into empdetails values(?,?,?)"); 
			Collection<String> c = lhm.values();
			Iterator<?> itr = c.iterator();
			int pos = 1;
			while(itr.hasNext()) {
				String val = (String) itr.next();
				pstmt.setString(pos, val);
				System.out.println(val);
				pos++;
			}
			pstmt.executeUpdate();
	}
	public ResultSet getEmpId() throws SQLException, ClassNotFoundException {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empapp","root","root");
			PreparedStatement pstmt = conn.prepareStatement("select eid from empdetails");
			java.sql.ResultSet rs = pstmt.executeQuery();
		return (ResultSet) rs;
	}
	public String updateEmp(String eid,String ename,String esal) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empapp","root","root");
		PreparedStatement pstmt = conn.prepareStatement("update empdetails set ename=? , esal=? where eid=?");
		pstmt.setString(1, ename);
		pstmt.setString(2, esal);
		pstmt.setString(3, eid);
		pstmt.executeUpdate();
		return "EmpId "+eid+" is Successfully Updated";
	}
	public void deleteEmp(String eid) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empapp","root","root");
		PreparedStatement pstmt = conn.prepareStatement("delete from empdetails where eid=?");
		pstmt.setString(1, eid);
		pstmt.executeUpdate();
		
	}
	public LinkedHashMap<Integer,ArrayList<String>> viewEmploys() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/empapp","root","root");
		PreparedStatement pstmt = conn.prepareStatement("Select * from empdetails");
		java.sql.ResultSet rs = pstmt.executeQuery();
		LinkedHashMap<Integer, ArrayList<String>> lhm = new LinkedHashMap<Integer, ArrayList<String>>();
		
		int pos = 1;
		while(rs.next()) {
			String eid = rs.getString("eid");
			String ename = rs.getString("ename");
			String esal = rs.getString("esal");
			ArrayList<String> al = new ArrayList<String>();
			al.add(eid);
			al.add(ename);
			al.add(esal);
			lhm.put(pos, al);
			pos++;
		}
		System.out.println(lhm);
		return lhm;
	}

}
