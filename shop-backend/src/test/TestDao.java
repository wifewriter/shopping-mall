import com.qf1801.group4.shop.dao.SysRoleMapper;
import com.qf1801.group4.shop.dao.SysUserMapper;
import com.qf1801.group4.shop.entity.SysRole;
import com.qf1801.group4.shop.entity.SysUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:spring-common.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestDao {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Test
    public void test1() {
        List<SysRole> sysRoles = sysRoleMapper.selectRolesByUserId("uuieasdfadfasdf");
        System.out.println(sysRoles.get(0).getSysUsers().get(0).getUsername());
    }

    @Test
    public void test2() {
        // SysUser sysUser = sysUserMapper.selectUser();
        // System.out.println(sysUser.getSysRoles().get(0).getName());
    }

    @Test
    public void test3() {
        SysUser sysUser = new SysUser();
        sysUser.setStatus(0);
        List<SysUser> sysUsers = sysUserMapper.selectUsers(sysUser);
        System.out.println(sysUser);
    }
}
