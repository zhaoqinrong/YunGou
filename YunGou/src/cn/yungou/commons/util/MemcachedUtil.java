package cn.yungou.commons.util;

import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;

public class MemcachedUtil {

    private static MemCachedClient cachedClient = new MemCachedClient();
    private static MemcachedUtil  memcached=new MemcachedUtil();
    private MemcachedUtil() {
    }

    static {
        /**
         * 创建一个SockIOPool实例(源码是静态方法返回实例)
         */
        SockIOPool pool = SockIOPool.getInstance();
        /**
         * 设置服务器和权重
         */
        String[] servers = { "127.0.0.1:11211" };
        Integer[] weights = { 3 };
        /**
         * 设置服务器信息
         */
        pool.setServers(servers);
        pool.setWeights(weights);
        /**
         * 设置初始连接数、最小连接数、最大连接数、最大处理时间
         */
        pool.setInitConn(10);
        pool.setMinConn(1);
        pool.setMaxConn(20);
        pool.setMaxIdle(1000 * 60 * 60);
        /**
         * 设置连接池维护线程的睡眠时间 设置为0，维护线程不启动
         * 维护线程主要通过log输出socket的运行状况，监测连接数目及空闲等待时间等参数以控制连接创建和关闭。
         */
        pool.setMaintSleep(30);
        /**
         * 设置是否使用Nagle算法，因为我们的通讯数据量通常都比较大（相对TCP控制数据）而且要求响应及时，因此该值需要设置为false（默认是true）
         */
        pool.setNagle(false);
        /**
         * 设置socket的读取等待超时值
         */
        pool.setSocketTO(3000);
        /**
         * 设置连接心跳监测开关。
         * 设为true则每次通信都要进行连接是否有效的监测，造成通信次数倍增，加大网络负载，因此该参数应该在对HA要求比较高的场合设为TRUE，默认状态是false。
         */
        pool.setAliveCheck(true);
        /**
         * 设置完pool参数后最后调用该方法，启动pool。
         */
        pool.initialize();


    }
    /**
     *
     * 对外获取工具类的方法
     * @return
     */
    public static MemcachedUtil getInstance(){
        return memcached;
    }
    /**
     * 缓存的增删替换等方法
     * @param key 缓存的K
     * @param value 缓存的V
     * @return
     */
    public static boolean add(String key, Object value) {
        return cachedClient.add(key, value);
    }

    public static boolean add(String key, Object value, Integer expire) {
        return cachedClient.add(key, value, expire);
    }

    public static boolean set(String key, Object value) {
        return cachedClient.set(key, value);
    }

    public static boolean set(String key, Object value, Integer expire) {
        return cachedClient.set(key, value, expire);
    }

    public static boolean replace(String key, Object value) {
        return cachedClient.replace(key, value);
    }

    public static boolean replace(String key, Object value, Integer expire) {
        return cachedClient.replace(key, value, expire);
    }
    public static boolean delete(String key) {
        return cachedClient.delete(key);
    }
    public static boolean flushAll(){
        return cachedClient.flushAll();
    }


    public static Object get(String key) {
        return cachedClient.get(key);
    }

}
