﻿using NASDMS.Systems;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestLog.RDS.ORM.Helper;

namespace TestLog.RDS.Services.AuditTrailServices
{
    public class AuditTrailService : IAuditTrailService
    {
        public static bool IsReadyForLogging = false;
        public NASDMS.Systems.ErrorCode GetAuditTrails(ref List<AuditTrail> auditTrails, Guid Oid)
        {
            ErrorCode err = ErrorCode.ERROR_SUCCESS;
            if (IsReadyForLogging == false)
            {
                return err;
            }
            try
            {
                auditTrails = RDSAuditTrail.GetAuditTrails(Oid);
                return err;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public ErrorCode AddAuditTrail(Guid Oid, string ChangedBy, string Data)
        {
            ErrorCode err = ErrorCode.ERROR_SUCCESS;
            if (IsReadyForLogging == false)
            {
                return err;
            }
            try
            {
                RDSAuditTrail.AddAuditTrail(Oid, ChangedBy, Data);
                return err;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
