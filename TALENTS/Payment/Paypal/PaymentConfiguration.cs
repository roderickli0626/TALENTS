﻿using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Payment.Paypal
{
    public class PaymentConfiguration
    {
        static string ClientId;
        static string ClientSecret;
        static bool IsTest = true;

        // Static constructor for setting the readonly static members.
        static PaymentConfiguration()
        {
            if (IsTest)
            {
                // sandbox configuration
                ClientId = "AR3kDAQ5S8icxRC7aHztxqwUC9vwhcVuxKN3ZkDw5GIgl5966Qb6ZDivVLOo-W4WqNz6oJOf9ARqLrD7";
                ClientSecret = "ECHoyudg_oQ7GAnkXMQ3S6gddJcB0wYqRJIuaykKgEyZwT_8lRjt5FAv6vIolSOo8gCc0AhOdfTmQCHo";
            }
            else
            {
                // live configuration
                ClientId = "Your Client ID for Live configuration";
                ClientSecret = "Your Client Secret  for Live configuration";
            }

        }

        // Create the configuration map that contains mode and other optional configuration details.
        public static Dictionary<string, string> GetConfig()
        {
            var config = new Dictionary<string, string>
            {
                {"mode", IsTest ? "sandbox" : "live"}
            };
            return config;
        }

        // Create accessToken
        private static string GetAccessToken()
        {
            // ###AccessToken
            // Retrieve the access token from
            // OAuthTokenCredential by passing in
            // ClientID and ClientSecret
            // It is not mandatory to generate Access Token on a per call basis.
            // Typically the access token can be generated once and
            // reused within the expiry window                
            string accessToken = new OAuthTokenCredential(ClientId, ClientSecret, GetConfig()).GetAccessToken();
            return accessToken;
        }

        // Returns APIContext object
        public static APIContext GetAPIContext(string accessToken = "")
        {
            // ### Api Context
            // Pass in a `APIContext` object to authenticate 
            // the call and to send a unique request id 
            // (that ensures idempotency). The SDK generates
            // a request id if you do not pass one explicitly. 
            var apiContext = new APIContext(string.IsNullOrEmpty(accessToken) ? GetAccessToken() : accessToken);
            apiContext.Config = GetConfig();

            // Use this variant if you want to pass in a request id  
            // that is meaningful in your application, ideally 
            // a order id.
            // String requestId = Long.toString(System.nanoTime();
            // APIContext apiContext = new APIContext(GetAccessToken(), requestId ));

            return apiContext;
        }
    }
}