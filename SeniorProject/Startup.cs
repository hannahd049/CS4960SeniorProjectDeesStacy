using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(SeniorProject.Startup))]

namespace SeniorProject
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}