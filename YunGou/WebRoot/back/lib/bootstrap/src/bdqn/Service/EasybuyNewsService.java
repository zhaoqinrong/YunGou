package bdqn.Service;


import bdqn.entity.EasybuyNews;

import java.io.Serializable;
import java.util.List;

public interface EasybuyNewsService {
    //查询
    public List<EasybuyNews> getAllNews();
    //增加用户
    public void addNews(EasybuyNews easybuyNews);
    //修改用户
    public void updateNews(EasybuyNews easybuyNews);
    //删除用户
    public void deleNews(Serializable id);
}
