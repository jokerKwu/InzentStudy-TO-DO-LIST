package maven_example;


import java.util.ArrayList;
import java.util.List;
import java.sql.*;


public class TodoDao {

	//싱글턴 패턴 적용
	private static TodoDao instance = new TodoDao();
	
	public static TodoDao getInstance() {
		return instance;
	}
	
	private TodoDao() {}
	
	public int addTodo(TodoDto dbDto) {
		int res=0;
		Connection conn = null;
		PreparedStatement ppst = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3307/db";
		String id = "root";
		String pw = "tngkr485";
		
		System.out.println("TodoDao.java 데이터 제대로 들어왔는지 테스트----------------");
		System.out.println("제목 : "+ dbDto.getTitle()+" 작성자  : "+dbDto.getName()+" 우선순위 : "+dbDto.getSequence());
		
		
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url,id,pw);
			
			String sql="insert into todo(title, name, sequence) values(?, ?, ?);";
			ppst = conn.prepareStatement(sql);
			
			ppst.setString(1,dbDto.getTitle());
			ppst.setString(2, dbDto.getName());
			ppst.setInt(3, dbDto.getSequence());
			
			
			
			ppst.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ppst != null) ppst.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				e2.getStackTrace();
			}
		}
		
		return res;
	}
	public List<TodoDto> getTodos(){
		List<TodoDto> res=new ArrayList<TodoDto>();
		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3307/db";
		String id = "root";
		String pw = "tngkr485";
		
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url,id,pw);
			
			String sql="select id, title, name, sequence, type, regdate from todo order by regdate desc";
			
			ppst = conn.prepareStatement(sql);
			
			rs = ppst.executeQuery();
			while(rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setId(rs.getLong("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setSequence(rs.getInt("sequence"));
				dto.setType(rs.getString("type"));
				dto.setRegDate(rs.getString("regdate"));
				
				res.add(dto);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}
	public int updateTodo(TodoDto dbDto) {
		int res=0;

		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3307/db";
		String id = "root";
		String pw = "tngkr485";
		
		try {
			String sql = null;
			if(dbDto.getType().equals("TODO")) {
				sql="update todo set type = 'DOING' where id = ?;";
			}else {
				sql="update todo set type = 'DONE' where id = ?;";
			}
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url,id,pw);
			
			ppst = conn.prepareStatement(sql);
			ppst.setLong(1, dbDto.getId());
			
			res=ppst.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}
	
}
