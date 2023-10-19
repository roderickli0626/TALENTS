using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS
{
    public class NotificationHub : Hub
    {
        public void SendNotification(string userID, string message)
        {
            Clients.User(userID).notify(message);
        }

        public void SendNotifications(string message)
        {
            Clients.All.receiveNotification(message);
        }
    }
}