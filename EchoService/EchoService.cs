using System;
using System.Collections.Generic;
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

        /// <summary>Echo's the passed Guid.</summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [OperationContract]
        public Guid EchoGuid(Guid request)
        {
            return request;
        }

        /// <summary>Echo's the passed ObjectId.</summary>
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

        [OperationContract]
        public Guid GenerateGuid()
        {
            return Guid.NewGuid();
        }

        [OperationContract]
        public IList<Guid> GenerateGuids(int count)
        {
            var response = new Guid[count];
            for (var i = 0; i < count; i++)
            {
                response[i] = Guid.NewGuid();
            }
            return response;
        }

        [OperationContract]
        public ObjectId GenetateObjectId()
        {
            return ObjectId.GenerateNewId();
        }

        [OperationContract]
        public IList<ObjectId> GenerateObjectIds(int count)
        {
            var response = new ObjectId[count];
            for (var i = 0; i < count; i++)
            {
                response[i] = ObjectId.GenerateNewId();
            }
            return response;
        }
    }
}
