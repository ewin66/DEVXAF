	
using System;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections.Generic;

namespace CMS.Domain
{
    // ############################################################################
    // #
    // #        ---==>  T H I S  F I L E  W A S  G E N E R A T E D  <==---
    // #
    // # This file was generated by PRO Spark, C# Edition, Version 4.5
    // # Generated on 11/2/2016 3:06:10 PM
    // #
    // # Edits to this file may cause incorrect behavior and will be lost
    // # if the code is regenerated.
    // #
    // ############################################################################
	
	// CMS Unit-of-Work

	public partial class CMSUnitOfWork : UnitOfWork
    {
        public CMSUnitOfWork() : base(new CMSDb()) { }
    }
}
