using System;
using System.ServiceModel;
using MongoDB.Bson;

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

        /// <summary>Echo operation.</summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [OperationContract]
        public ObjectId EchoObjectId(ObjectId request)
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
