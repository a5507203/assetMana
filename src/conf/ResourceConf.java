package conf;

import java.util.Properties;

public class ResourceConf {

	public static Properties config = new Properties();
	public final static String KEY_FOR_IMG_PATH_SERVICE = "IMG_PATH_SERVICE";
	public final static String KEY_FOR_IMG_PATH_DEVICE = "IMG_PATH_DEVICE";
	public final static String KEY_FOR_IMG_PATH_PRODUCT = "IMG_PATH_PRODUCT";
	public final static String FILE_PATH = "FILE_PATH";
	public final static String PHOTO_PATH = "PHOTO_PATH";
	public final static String XLS_PATH = "XLS_PATH";
	public final static String XLS_PATH_PRODUCT = "XLS_PATH_PRODUCT";
	public final static String XLS_PATH_DEVICE = "XLS_PATH_DEVICE";
	public final static String XLS_PATH_SERVICE = "XLS_PATH_SERVICE";
	public final static String LIST_MSG_INTERVAL = "LIST_MSG_INTERVAL";
	public final static String LIST_MSG_MAX = "LIST_MSG_MAX";
	public final static String LIST_NEWS_INTERVAL = "LIST_NEWS_INTERVAL";
	public final static String LIST_NEWS_MAX = "LIST_NEWS_MAX";
	public final static String LIST_FILE_INTERVAL = "LIST_FILE_INTERVAL";
	public final static String LIST_FILE_MAX = "LIST_FILE_MAX";
	public final static String KEY_FOR_SYS_SWITHER = "TURN_ON";

	public final static int AUDIT_STATUS_APPLICATION = 1;
	public final static int AUDIT_STATUS_APPROVE = 2;
	public final static int AUDIT_STATUS_DENY = 3;

	public final static int TYPE_APP_RES_SERVICE = 1;
	public final static int TYPE_APP_RES_DEVICE = 2;
	public final static int TYPE_APP_RES_PRODUCT = 3;

	public static String get(String key, String def) {
		return config.getProperty(key, def);
	}

}
