	
using System;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections.Generic;

namespace AutoMapper.RDS
{ 
    // ############################################################################
    // #
    // #        ---==>  T H I S  F I L E  W A S  G E N E R A T E D  <==---
    // #
    // # This file was generated by the CodeGen Prototype
    // # Generated on 2/13/2017 2:16:21 PM
    // #
    // # Edits to this file may cause incorrect behavior and will be lost
    // # if the code is regenerated.
    // #
    // ############################################################################
	
	// AutoMapper Domain objects
	
	public partial class WebContent : Entity<WebContent>
	{
		public WebContent() { }
		public WebContent(bool defaults) : base(defaults) { }

        public int? Id { get; set; }
        public int Website { get; set; }
        public int PageComponent { get; set; }
        public int Language { get; set; }
        public string Routing { get; set; }
        public string Notes { get; set; }
        public string PublishedData { get; set; }
        public int? CurrentVersion { get; set; }
        public bool IsActive { get; set; }
    }
}
