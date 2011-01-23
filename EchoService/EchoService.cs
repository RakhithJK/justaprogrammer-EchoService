using System.ServiceModel;

namespace EchoService
{
    /// <summary>Simple test service.</summary>
    [ServiceContract]
    public sealed class EchoService
    {
    	/// <summary>Echo operation.</summary>
    	/// <param name="request"></param>
    	/// <returns></returns>
        [OperationContract]
        public string Echo(string request)
        {
            return request;
        }
        
    	/// <summary>EchoDate operation.</summary>
    	/// <param name="request"></param>
    	/// <returns></returns>
        [OperationContract]
        public DateTime EchoDate(DateTime request)
        {
            return request;
        }
    }
}
