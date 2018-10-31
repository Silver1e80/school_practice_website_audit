using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_20180411WebSite.Startup))]
namespace _20180411WebSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
