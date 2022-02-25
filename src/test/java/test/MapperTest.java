package test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;

/**
 * 测试dao工作层
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;

	/**
	 * 测试departmentMapper
	 */
	@Test
	public void testCRUD() {
//		//1.创建springIoc容器
//		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//		//2.从容器中获取bean
//		DepartmentMapper bean = context.getBean(DepartmentMapper.class);
//		System.out.println(departmentMapper);
//		插入部门
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
//		System.out.println(departmentMapper.selectByPrimaryKey(1));;
//      生成员工数据，测试员工插入
//		employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@qq.com", 1));
//		批量插入多个员工，使用可以执行批量操作的sqlsession
	//	EmployeeMapper mapper = (EmployeeMapper) sqlSession.getMapper(EmployeeMapper.class);
	//	for (int i = 0; i < 1000; i++) {
//			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new Employee(null, uid,"M", uid+"@qq.com", 1));
//		}
//		System.out.println("success");
	}
}
