package cn.yungou.user.Service.ServiceImpl;


import cn.yungou.user.Service.EasybuyUserService;
import cn.yungou.user.dao.EasybuyUserDao;
import cn.yungou.user.dao.impl.EasybuyUserDaoImpl;
import cn.yungou.commons.entity.EasybuyUser;
import org.apache.log4j.Logger;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

public class EasybuyUserServiceImpl implements EasybuyUserService {
   private EasybuyUserDao easybuyUserDao= new EasybuyUserDaoImpl();
	private Logger logger=Logger.getLogger(EasybuyUserServiceImpl.class);
    @Override
    public List<EasybuyUser> getAllUser() {
        return    easybuyUserDao.getAll();

    }

    @Override
    public int  addUser(EasybuyUser easybuyUser) {
       int rownum= easybuyUserDao.add(easybuyUser);
       if(rownum>0){
    	   logger.info("增加成功");
        }else {
        	logger.info("新增失败");
       }
       return rownum;
    }

    @Override
    public int updateUser(EasybuyUser easybuyUser) {
       int rowsnum=easybuyUserDao.update(easybuyUser);
       if(rowsnum>0){
    	   logger.info("修改成功");
       }else{
    	   logger.info("修改失败");
       }
       return rowsnum;

    }

    @Override
    public int deleUser(Serializable id) {
     int rownum = easybuyUserDao.delete(id);
     if(rownum>0){
    	 logger.info("删除成功");
     }else{
         logger.info("删除失败");
     }
     return rownum;
    }

    @Override
    public EasybuyUser login(String loginName, String password) {

         return easybuyUserDao.getUserByNameAndPassword(loginName, password);

    }
    @Override
    public EasybuyUser findByLoginName(String loginName){

        return easybuyUserDao.findByLoginName(loginName);


    }

    @Override
    public EasybuyUser findById(Serializable id) throws SQLException {

        return easybuyUserDao.findById(id);
    }
}
