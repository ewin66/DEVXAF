//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestLog.RDS
{
    using System;
    using System.Collections.Generic;
    
    public partial class AuditTrail
    {
        public int Id { get; set; }
        public string Oid { get; set; }
        public string Data { get; set; }
        public string ChangedBy { get; set; }
        public System.DateTime ChangedOn { get; set; }
    }
}
