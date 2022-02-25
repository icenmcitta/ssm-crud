package com.atguigu.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 *处理员工CRUD请求
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	/**
	 * 单个批量二合一 批量删除：1-2-3 单个删除：1
	 */
	@ResponseBody
	@DeleteMapping("/emp/{ids}")
	public Msg deleteEmpById(@PathVariable("ids") String ids) {
		//批量删除
		if (ids.contains("-")) {
			List<Integer> del_ids = new ArrayList();
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
		} else {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}

	/**
	 * 员工更新方法
	 */
	@PutMapping("/emp/{empId}")
	@ResponseBody
	public Msg saveEmp(Employee employee, HttpServletRequest request) {
		System.out.println("请求体中的值：" + request.getParameter("email"));
		System.out.println("将要更新的员工数据：" + employee);
		employeeService.updateEmp(employee);
		return Msg.success();
	}

	/**
	 * 根据id查询员工
	 */
	@GetMapping("/emp/{id}")
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer empId) {
		Employee employee = employeeService.getEmp(empId);
		return Msg.success().add("emp", employee);
	}

	/**
	 * 检验用户名是否可用
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName") String empName) {
		//先判断用户名是否是合法的表达式
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位字母和数字的组合或2-5位中文");
		}
		//数据库用户名重复校验
		boolean b = employeeService.checkUser(empName);
		System.out.println(empName);
		if (b) {
			System.out.println("true");
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
	}

	/**
	 * 员工保存
	 */
	@PostMapping("/emp")
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap();
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名：" + fieldError.getField());
				System.out.println("错误信息：" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}

	/**
	 * 导入json包
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber) {
		PageHelper.startPage(pageNumber, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 查询员工数据（分页查询）
	 */
//	@RequestMapping("/emps")
	public String getEmployees(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber, Model model) {
//      引入分页插件，在查询之前只需调用，传入页码以及每页的大小
		PageHelper.startPage(pageNumber, 5);
		List<Employee> emps = employeeService.getAll();
//      使用pageinfo包装查询后的结果，只需将pageinfo交给页面
		PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
//		System.out.println("page Put");
//		封装了详细的分页信息，包括查询出的数据，传入连续显示的页数
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
