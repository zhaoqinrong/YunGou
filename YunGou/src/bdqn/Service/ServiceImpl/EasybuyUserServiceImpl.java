package bdqn.Service.ServiceImpl;


import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import bdqn.Service.EasybuyUserService;
import bdqn.dao.impl.EasybuyUserDaoImpl;
import bdqn.entity.EasybuyUser;

public class EasybuyUserServiceImpl implements EasybuyUserService {
	private Logger logger=Logger.getLogger(EasybuyUserServiceImpl.class);
    @Override
    public List<EasybuyUser> getAllUser() {
        return     new EasybuyUserDaoImpl().getAll();

    }

    @Override
    public int  addUser(EasybuyUser easybuyUser) {
       int rownum= new EasybuyUserDaoImpl().add(easybuyUser);
       if(rownum>0){
    	   logger.info("增加成功");
        }else {
        	logger.info("新增失败");
       }
       return rownum;
    }

    @Override
    public int updateUser(EasybuyUser easybuyUser) {
       int rowsnum= new EasybuyUserDaoImpl().update(easybuyUser);
       if(rowsnum>0){
    	   logger.info("修改成功");
           System.out.println("修改成功");
       }else{
    	   logger.info("修改失败");
       }
       return rowsnum;

    }

    @Override
    public int deleUser(Serializable id) {
     int rownum = new EasybuyUserDaoImpl().delete(id);
     if(rownum>0){
    	 logger.info("删除成功");
     }else{
         logger.info("删除失败");
     }
     return rownum;
    }

    @Override
    public EasybuyUser login(String loginName, String password) {
        EasybuyUser user = new EasybuyUserDaoImpl().getUserByNameAndPassword(loginName, password);

         return user;

    }
    @Override
    public EasybuyUser findByLoginName(String loginName){

        return new EasybuyUserDaoImpl().findByLoginName(loginName);


    }

    @Override
    public EasybuyUser findById(Serializable id) throws SQLException {

        return new EasybuyUserDaoImpl().findById(id);
    }
}
