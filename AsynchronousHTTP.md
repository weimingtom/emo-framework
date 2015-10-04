# Asynchronous HTTP request and callback #

## Note: This is experimental feature and may not work well in some situations. ##

emo-framework has simple interface to retrieve the content from the web. Because http request is heavier operation generally and it has no guarantee when the response will return, emo-framework implement the http request as asynchronous callback.

## Request the content through Internet ##

Requesting the content from the web is quite simple. Use emo.Net.request function to retrieve the content. Additional parameter can be added by using extra parameter to the request. Note the the first parameter should be unique name so that you have to decide which event is returned at the asynchronous callback in later event.

```
const MY_REQUEST_NAME = 'My Request';
const MY_REQUEST_NAME_BY_GET  = 'My Request by GET';
const MY_REQUEST_NAME_BY_POST = 'My Request by POST';

// http request (default request method is 'GET')
emo.Net.request(MY_REQUEST_NAME, "http://www.example.com/");
			
// http request with METHOD and request timeout(msec)
emo.Net.request(MY_REQUEST_NAME_BY_GET, "http://www.example.com/", "GET", 1000);
			
// http request with METHOD, timeout and parameters
emo.Net.request(MY_REQUEST_NAME_BY_POST, "http://www.example.com/",
		"POST", 1000, "key1", "value1", "key2", "value2");

```

## onNetCallback(name, response, error) ##

Called when the server returns their content. The first parameter 'name' is the parameter that you have set to the emo.Net.request function. If the http request error has occured the name equals 'HTTP\_ERROR'. The second parameter 'response' is the response content from the server. The last parameter 'error' is the error details that can use when the http request error occurs.

```
/*
 * Asynchronous http request callback
 */
function onNetCallback(name, response, err) {
  if (name == MY_REQUEST_NAME) {
    print("ACCESS: OK!");
    print(format("============ RESPONSE FROM %s ============", name));
    print(response);
  } else if (name == HTTP_ERROR) {
    print("ACCESS: FAILED");
    // if the request has failed, name equals HTTP_ERROR
    // and the response equals the request name (the first parameter you have set to the emo.Net.request).
    print(format("============ ERROR RESPONSE FROM %s ============", response));
    // print the error description and error code.
    print(err.code);
    print(err.message);
    }
}
```

## Enabling Internet Access (Android) ##

To use Internet access for Android, "android.permission.INTERNET" permission should be enabled in AndroidManifest.xml.

```
<uses-permission android:name="android.permission.INTERNET" />
```