import UIKit


//MARK:- URLSessionConfiguration
//URLSessionConfiguration also lets you configure session properties such as timeout values, caching policies and HTTP headers. Refer to Apple’s documentation for a full list of configuration options.

//MARK:- URLSessionTask
//URLSessionTask is an abstract class that denotes a task object. A session creates one or more tasks to do the actual work of fetching data and downloading or uploading files.

//There are three types of concrete session tasks:


//MARK:- URLSessionDataTask:
//Use this task for GET requests to retrieve data from servers to memory.

//MARK:-URLSessionUploadTask:
//Use this task to upload a file from disk to a web service via a POST or PUT method.

//MARK:-URLSessionDownloadTask:
//Use this task to download a file from a remote service to a temporary file location.


URLSession.shared.

let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
        // Evaluate error
   
    // process data
}
