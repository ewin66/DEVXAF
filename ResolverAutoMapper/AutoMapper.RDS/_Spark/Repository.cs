	
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
	
	// AutoMapper Context. hosts all repositories

	public static class AutoMapperContext
	{
		static Db db = new AutoMapperDb();
		
		// entity specific repositories

        public static WebContents WebContents { get { return new WebContents(); } }

		// general purpose operations

		public static void Execute(string sql, params object[] parms) { db.Execute( sql, parms ); }
		public static IEnumerable<dynamic> Query(string sql, params object[] parms) { return db.Query( sql, parms ); }
		public static object Scalar(string sql, params object[] parms) { return db.Scalar( sql, parms ); }

		public static DataSet GetDataSet(string sql, params object[] parms) { return db.GetDataSet( sql, parms ); }
		public static DataTable GetDataTable(string sql, params object[] parms) { return db.GetDataTable( sql, parms ); }
		public static DataRow GetDataRow(string sql, params object[] parms) { return db.GetDataRow( sql, parms ); }
	}
}
