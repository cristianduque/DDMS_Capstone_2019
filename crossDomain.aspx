<html>
    <head>
        <title>Cross-domain sample</title>
    </head>
    <body>
        <!-- This is the placeholder for the announcements -->
        <div id="renderAnnouncements"></div>
      <!--  <script
            type="text/javascript"
            src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"
          >

        </script>-->
        <form>
    <input type='text' id='name'>
        <button type="button" onclick="execCrossDomainRequestPost();">Submit</button>
      </form>
        <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <script type="text/javascript">
          var hostweburl;
          var appweburl;

          // Load the required SharePoint libraries
          $(document).ready(function () {
            //Get the URI decoded URLs.
            hostweburl = "https://aguadillana.sharepoint.com/sites/DDMS/" ;
              /*  decodeURIComponent(
                    getQueryStringParameter("SPHostUrl")
            );*/
            appweburl = "https://aguadillana.sharepoint.com/sites/DDMS/" ;
              /*  decodeURIComponent(
                    getQueryStringParameter("SPAppWebUrl")
            );*/

            // resources are in URLs in the form:
            // web_url/_layouts/15/resource
            var scriptbase = hostweburl + "/_layouts/15/";

            // Load the js files and continue to the successHandler
            $.getScript(scriptbase + "SP.RequestExecutor.js", execCrossDomainRequest);
          });

          function execCrossDomainRequestPost() {
            // executor: The RequestExecutor object
            // Initialize the RequestExecutor with the add-in web URL.
            console.log($('#name').val());
            var executor = new SP.RequestExecutor(appweburl);
            executor.executeAsync({
               url: "https://aguadillana.sharepoint.com/sites/DDMS/_api/web/lists/getbyTitle('Product')/items",
               method: "POST",
               body: JSON.stringify({
                   '__metadata': {
                       'type': 'SP.Data.ProductListItem' // it defines the ListEntityTypeName
                   },
                   "a83e": $('#name').val()//this.editedItemProducts.a83e,
                  /* "e9lf": this.editedItemProducts.e9lf,
                   "qrdu": this.editedItemProducts.qrdu,
                   "r0hu": this.editedItemProducts.r0hu,
                   "s2l1": this.editedItemProducts.s2l1,
                   "se1v": this.editedItemProducts.se1v,
                   "status": 'Active'*/
               }),

               headers: {
                   "accept": "application/json;odata=verbose",
                   "content-type": "application/json;odata=verbose",
                   //"X-RequestDigest": this.RequestDigest
                   //"Cookie": "FedAuth=77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U1A+VjUsMGguZnxtZW1iZXJzaGlwfDEwMDMyMDAwM2NlMjFmNzNAbGl2ZS5jb20sMCMuZnxtZW1iZXJzaGlwfGNhcHN0b25lQGxhYWd1YWRpbGxhbmEuY29tLDEzMTk5MTIzNjkwMDAwMDAwMCwxMzE5NTA2MjUwMzAwMDAwMDAsMTMxOTkyMTAxMDc5MDU1MjkwLDAuMC4wLjAsMixmNDRiNzA4OC0xNTc5LTQ3OWUtYTQ3NS1iZmQyYjQ2MDI0OWEsLCxhZWE4ZDA5ZS00MDc4LTgwMDAtOTk5NS1kODc2MTViMDEyOGYsYWVhOGQwOWUtNDA3OC04MDAwLTk5OTUtZDg3NjE1YjAxMjhmLCwwLDAsMCwsYmJXUStQWDUwekRyWHhBLzdOcHhlM0JpS0FaZEtrMTRNRGtFOW9GWUQ2aE9QZFBqMTZIUlVIOGRjWWRnOGVkT0doM2p6VVduZkY4U25MRDRPTW9LQTFFVWZ0UzhENUNkc1lheHg1OGdKSUo2U1ZoTjJlT3VHcmM4M2pISFREQ0xVdmVrTEgzMFJBWVpkU2xicmFmc0grVkV1TWhjN2l2ZThwWE5Kc3djWDJxbS9OWEVKREhBVC9NZk9OTTd3MzEzaVBxWmJXT2hETkx1Z2orMTJ3SE83M3NwRkorOHQxYllTOEJxU0hqQURuWVFrV2lRdVY4aHBWL011ekNJSU4zSXpKNVdodHA4c1YwTjNxTUhpTFluZEJUT245MzVud1ljRHUyVE5yaTZsWGE4NUhXb0ZkbDdiazljQ1FVUDUxcUFmRXNBZldzU2Z6UEluK2dhRGN4UnJnPT08L1NQPg==; path=/; secure; HttpOnly",
                   //"Cookie": "rtFa=ibALGjJdBQDSLFH1z9kQ0+CkjjfKKbdDQnfCAHKKjzcmRjQ0QjcwODgtMTU3OS00NzlFLUE0NzUtQkZEMkI0NjAyNDlBr0JITHJLD45lVwPZQR5mn5F95FfVvEqF0WrL2388U7Czs5a7Yz8P0CCCj7llogci6rPTv3DAri+iLcdArQQ/rKlHCc7UNZyiF0UKRP8iDtyrwayhlMlkpXCr8VqTybmiQ3cdK71Odk9PdfQkPXw5O5Re+RrY7bkGLXuHh1T4KYLw/5qLsKgT1Jj/DQS6owOquGRVvTe+Trte1Eioz7mKBgQN5e0Gkb06+NDdtInIRAjevi5ot7BIgeb0bSvz9EGCtVO9xlzmm3n2PN7wuJR7NDp22U9XkJ3G0NoNWHwWaR12+wgGZLYZ2ds68BsSl77XmIUAOV4mCui1yTaXkoeFn0UAAAA=; domain=sharepoint.com; path=/; secure; HttpOnly"
               },
               success: function(data) {
                   console.log("Item created successfully");
                   //this.getListData();
               },
               error: function(error) {
                   console.log(JSON.stringify(error));

               }

        });
      }
          // Function to prepare and issue the request to get
          //  SharePoint data
          function execCrossDomainRequest() {
            // executor: The RequestExecutor object
            // Initialize the RequestExecutor with the add-in web URL.
            var executor = new SP.RequestExecutor(appweburl);

            // Issue the call against the add-in web.
            // To get the title using REST we can hit the endpoint:
            //      appweburl/_api/web/lists/getbytitle('listname')/items
            // The response formats the data in the JSON format.
            // The functions successHandler and errorHandler attend the
            //      sucess and error events respectively.
            executor.executeAsync(
                {
                  url:
                      appweburl +
                      "/_api/web/lists/getbytitle('Events')/items",
                  method: "GET",
                  headers: { "Accept": "application/json; odata=verbose" },
                  success: successHandler,
                  error: errorHandler
                }
            );
          }

          // Function to handle the success event.
          // Prints the data to the page.
          function successHandler(data) {
            var jsonObject = JSON.parse(data.body);
            var announcementsHTML = "";

            var results = jsonObject.d.results;
            for (var i = 0; i < results.length; i++) {
              announcementsHTML = announcementsHTML +
                  "<p><h1>" + results[i].Title +
                  "</h1>" + results[i].Body +
                  "</p><hr>";
            }

            document.getElementById("renderAnnouncements").innerHTML =
                announcementsHTML;
          }

          // Function to handle the error event.
          // Prints the error message to the page.
          function errorHandler(data, errorCode, errorMessage) {
            document.getElementById("renderAnnouncements").innerText =
                "Could not complete cross-domain call: " + errorMessage;
          }

          // Function to retrieve a query string value.
          // For production purposes you may want to use
          //  a library to handle the query string.
          function getQueryStringParameter(paramToRetrieve) {
            var params =
                document.URL.split("?")[1].split("&amp;");
            var strParams = "";
            for (var i = 0; i < params.length; i = i + 1) {
              var singleParam = params[i].split("=");
              if (singleParam[0] == paramToRetrieve)
                return singleParam[1];
            }
          }
        </script>
    </body>
</html>
