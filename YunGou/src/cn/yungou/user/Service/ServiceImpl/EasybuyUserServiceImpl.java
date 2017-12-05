package cn.yungou.user.Service.ServiceImpl;


import cn.yungou.commons.constant.Constant;
import cn.yungou.commons.entity.EasybuyUser;
import cn.yungou.commons.entity.Page;
import cn.yungou.commons.util.BeanFactory;
import cn.yungou.commons.util.EmailUtils;
import cn.yungou.user.Service.EasybuyUserService;
import cn.yungou.user.dao.EasybuyUserDao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

public class EasybuyUserServiceImpl implements EasybuyUserService {
   private static final EasybuyUserDao EASYBUYUSERDAO= (EasybuyUserDao) BeanFactory.getBean("userdao");

    public EasybuyUserServiceImpl() throws Exception {
    }



   @Override
    public int add(EasybuyUser easybuyUser) {
       int rownum= EASYBUYUSERDAO.add(easybuyUser);
       if(rownum>0){
           Constant.LOGGER.info("增加成功");
    	   String content="尊敬的"+easybuyUser.getLoginName()+",欢迎您注册易买网,<a href='http://192.168.50.47:80/user?action=active&code="+easybuyUser.getCode()+"' target='_blank'>点此激活</a>";
         /*  String content="尊敬的"+easybuyUser.getLoginName()+",欢迎您注册易买网,http://127.0.0.1:80/YunGou/user?action=active&code="+easybuyUser.getCode();*/
           EmailUtils.sendEmail(easybuyUser.getEmail(),"用户激活",content);
        }else {
           Constant.LOGGER.info("新增失败");
       }
       return rownum;
    }

    @Override
    public int update(EasybuyUser easybuyUser) {
       int rowsnum=EASYBUYUSERDAO.update(easybuyUser);
       if(rowsnum>0){
           Constant.LOGGER.info("修改成功");
       }else{
           Constant.LOGGER.info("修改失败");
       }
       return rowsnum;

    }

    @Override
    public int delete(Serializable id) {
     int rownum = EASYBUYUSERDAO.delete(id);
     if(rownum>0){
         Constant.LOGGER.info("删除成功");
     }else{
         Constant.LOGGER.info("删除失败");
     }
     return rownum;
    }

    @Override
    public EasybuyUser login(String loginName, String password) {

         return EASYBUYUSERDAO.getUserByNameAndPassword(loginName, password);

    }
    @Override
    public EasybuyUser findByLoginName(String loginName){

        return EASYBUYUSERDAO.findByLoginName(loginName);


    }

    @Override
    public EasybuyUser findById(Serializable id) throws SQLException {

        return EASYBUYUSERDAO.findById(id);
    }

    /**
     * 用户激活
     * @param code 激活码
     * @return
     */
    @Override
    public EasybuyUser active(String code) {
        //1通过code获取一个用户
       EasybuyUser user= EASYBUYUSERDAO.getByCode(code);
        //2判断用户是否为空
        if(user==null){
            Constant.LOGGER.debug("用户为空");
           return null;
        }

        //3修改用户状态
        //设置用户状态
        user.setStatus(1);
        EASYBUYUSERDAO.update(user);
        return user;
    }

    @Override
    public EasybuyUser findByCode(String code) {
        return EASYBUYUSERDAO.findByCode(code);
    }

    @Override
    public Page<EasybuyUser> getAllByPage(Integer currPage) {
        Page<EasybuyUser> page = new Page<>();
        int total = EASYBUYUSERDAO.getCount();
        page.setTotal(total);
        page.setPageSize(6);
        page.setCurrPage((int)currPage);
        List<EasybuyUser> allByPage = EASYBUYUSERDAO.getAllByPage(page);
        page.setList(allByPage);
        return page;
    }
}
