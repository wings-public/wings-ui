using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebGAP.Startup))]
namespace WebGAP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
