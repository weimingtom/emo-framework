package com.emo_framework;

import android.app.NativeActivity;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.util.Log;

import java.util.List;
import java.util.ArrayList;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.HttpResponse;

public class EmoActivity extends NativeActivity {

    public static final String ECHO  = "ECHO";
    public static final String ERROR = "ERROR";
    
    public static final String ENGINE_TAG = "EmoFramework";

    protected String lastErrorMessage;
    protected String lastErrorType;
    
    public String echo(String str) {
        callback(ECHO, str);
        return str;
    }
    
    public String getLastErrorMessage() {
    	return lastErrorMessage;
    }
    
    public String getLastErrorType() {
    	return lastErrorType;
    }

    public void asyncHttpRequest(final String name, final int timeout, final String... params) {
		runOnUiThread(new Runnable() {
			public void run() {
		        NetworkRequestTask aTask = new NetworkRequestTask(name, timeout);
		        aTask.execute(params);
			}
		});
    }

    class NetworkRequestTask extends AsyncTask<String, Void, String> {
        String name;
        int    timeout;
        NetworkRequestTask(String name, int timeout) {
            this.name = name;
            this.timeout = timeout;
        }
        protected String doInBackground(String... params) {
            if (params.length == 0) return "";

            String url    = params[0];
            String method = "GET";
            
            if (params.length > 1) method = params[1];

            if (method.toUpperCase().equals("GET")) {
            	if (params.length > 2) {
                	StringBuffer data = new StringBuffer();
            		for (int i = 2; i < params.length; i++) {
            			data.append(params[i]);
            			if (i % 2 == 0) {
            				data.append("=");
            			} else if (i < params.length -1){
            				data.append("&");
            			}
            		}
            		url = url + "?" + data.toString();
            	}

            	return httpRequestByGET(url, timeout);
            } else if (method.toUpperCase().equals("POST")) {
        		List<NameValuePair> data = new ArrayList<NameValuePair>();
            	if (params.length > 2) {
            		String key = "";
            		for (int i = 2; i < params.length; i++) {
            			if (i % 2 == 0) {
            				key = params[i];
            			} else if (i < params.length -1){
            				NameValuePair pair = new BasicNameValuePair(key, params[i]);
            				data.add(pair);
            				key = "";
            			}
            		}
            	}
            	return httpRequestByPOST(url, timeout, data);
            }
            return "";
        }
        protected void onPostExecute(String response) {
        	if (response == null) {
        		callback(ERROR, name);
        	} else {
                callback(name, response);
        	}
        }
    }
    
    protected void saveError(Exception e) {
    	lastErrorType    = e.getClass().getName();
    	lastErrorMessage = e.getMessage();
    }

    public String httpRequestByGET(String url, int timeout) {
        String response = "";
        try {
            HttpClient httpClient = new DefaultHttpClient();
            HttpParams params     = httpClient.getParams();
            HttpConnectionParams.setConnectionTimeout(params, timeout);
            HttpConnectionParams.setSoTimeout(params, timeout);
            HttpResponse serverResponse = httpClient.execute(new HttpGet(url));
            if (serverResponse.getStatusLine().getStatusCode() < 400){
                InputStream inputStream = serverResponse.getEntity().getContent();
                InputStreamReader inputReader = new InputStreamReader(inputStream);
                BufferedReader bufferedReader = new BufferedReader(inputReader);
                StringBuffer buffer = new StringBuffer();
                String line;
                while((line = bufferedReader.readLine()) != null){
                    buffer.append(line);
                }
                response = buffer.toString();
                inputStream.close();
            }
        } catch (IOException e) {
        	saveError(e);
            return null;
        }
        return response;
    }

    public String httpRequestByPOST(String url, int timeout, List<NameValuePair> params) {
        String response = "";
        try {
            HttpClient httpClient = new DefaultHttpClient();
        	HttpPost httpPost = new HttpPost(url);
            httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
        	
            HttpResponse httpResponse = httpClient.execute(httpPost);
            if (httpResponse.getStatusLine().getStatusCode() < 400){
                InputStream inputStream = httpResponse.getEntity().getContent();
                InputStreamReader inputReader = new InputStreamReader(inputStream);
                BufferedReader bufferedReader = new BufferedReader(inputReader);
                StringBuffer buffer = new StringBuffer();
                String line;
                while((line = bufferedReader.readLine()) != null){
                	buffer.append(line);
                }
                response = buffer.toString();
                inputStream.close();
            }
        	
        } catch (IOException e) {
        	saveError(e);
        	return null;
        }
    	return response;
    }
    
    public String getRuntimeScriptName() {
    	try {
    	    ActivityInfo ai = getPackageManager().
    	    	getActivityInfo(this.getComponentName(), PackageManager.GET_META_DATA);
    	    return ai.metaData.getString("emo.script.runtime");
    	} catch (Exception e) {
    		return null;
    	}
    }

    public String getMainScriptName() {
    	try {
    	    ActivityInfo ai = getPackageManager().
    	    	getActivityInfo(this.getComponentName(), PackageManager.GET_META_DATA);
    	    return ai.metaData.getString("emo.script.main");
    	} catch (Exception e) {
    		return null;
    	}
    }

    public void LOGI(String message) {
    	Log.i(ENGINE_TAG, message, null);
    }

    public void LOGE(String message) {
    	Log.e(ENGINE_TAG, message, null);
    }

    public void LOGW(String message) {
    	Log.w(ENGINE_TAG, message, null);
    }

    public void setOrientationLandscape() {
		setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
    }
    
    public void setOrientationPortrait() {
		setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
    }
    
    public String getDeviceName() {
    	return android.os.Build.DEVICE;
    }
    
    public boolean isSimulator() {
    	return "sdk".equals(android.os.Build.MODEL) && "generic".equals(android.os.Build.DEVICE);
    }
    
    public native void callback(String name, String value);
}