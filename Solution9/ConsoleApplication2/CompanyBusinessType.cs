//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleApplication2
{
    using System;
    using System.Collections.Generic;
    
    public partial class CompanyBusinessType
    {
        public int Id { get; set; }
        public int IdCompany { get; set; }
        public int IdBusinessType { get; set; }
    
        public virtual BusinessType BusinessType { get; set; }
        public virtual Company Company { get; set; }
    }
}
