	
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
	
	// AutoMapper Unit-of-Work

	public partial class AutoMapperUnitOfWork : UnitOfWork
	{
		public AutoMapperUnitOfWork() : base(new AutoMapperDb()) { }
	}
}
