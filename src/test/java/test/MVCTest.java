package test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.atguigu.crud.bean.Employee;
import com.github.pagehelper.PageInfo;

/**
 * 使用Spring测试模块提供的测试请求功能，测试crud请求的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MVCTest {
	// 传入springMvc的ioc容器
	@Autowired
	WebApplicationContext context;

	// 虚拟mvc请求，获取处理结果
	MockMvc mocMvc;

	@Before
	public void initMoKcMvc() {
		mocMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPage() throws Exception {
		// 模拟请求拿到返回值
		MvcResult result = mocMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNumber", "1")).andReturn();
		// 请求成功以后，请求域中会有pageInfo，可以取出pageInfo进行验证
		MockHttpServletRequest request = result.getRequest();
		PageInfo<Employee> page = (PageInfo<Employee>) request.getAttribute("pageInfo");
		System.out.println("当前页码" + page.getPageNum());
		System.out.println("总页码" + page.getPages());
		System.out.println("总记录数" + page.getTotal());
		System.out.println("在页面需要连续显示的页码");
		for (int i : page.getNavigatepageNums()) {
			System.out.println(" " + i);
		}
		
// 		获取员工数据
		List<Employee> emps = page.getList();
		for(Employee emp : emps) {
			System.out.println("id:"+emp.getEmpId()+"->name:" +emp.getEmpName());
		}
	}
}
