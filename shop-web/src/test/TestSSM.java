import com.qf1801.group4.shop.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = "classpath:spring-common.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestSSM {


    @Autowired
    private UserService userService;

    @Test
    public void test1() {
        userService.list().stream().forEach(System.out::println);
    }
}
