using System.Net;

namespace WebGAP.Account
{
    internal class Web
    {
        private NetworkCredential credentials;

        public Web(NetworkCredential credentials)
        {
            this.credentials = credentials;
        }
    }
}