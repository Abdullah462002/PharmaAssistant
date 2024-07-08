package com.pharma.constants;

public class QueryConstants {
	
	private QueryConstants() {
		super();
	}
	public static final String LOGINSQL = """
			select password from user where username=?
			""";
	public static final String ADDSQL="""
			insert into pharmabatch values(?,?,?,?,?,?)
			""";
	public static final String SEARCHSQL = """
			select * from pharmabatch where BatchCode=?
			""";
	public static final String DELETESQL = """
			delete from pharmabatch where BatchCode=?
			""";
	public static final String SHOWSQL = """
			select * from pharmabatch
			""";
	public static final String UPDATESQL = """
			update pharmabatch set MedicineCode =?,
			Weight=?,Price=?,MedicineType=?,Refrigeration=? where BatchCode=?
			""";
	public static final String MEDLI="""
			select DISTINCT MedicineCode from pharmabatch
			""";
}
