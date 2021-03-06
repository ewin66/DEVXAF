﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestEntityWithMysql;

namespace TestEntityWithMysql.Controllers
{
    public class HistoryController : Controller
    {
        private DucTestMySqlEntities db = new DucTestMySqlEntities();

        // GET: History
        public ActionResult Index()
        {
            return View(db.tb_History.ToList());
        }

        // GET: History/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_History tb_History = db.tb_History.Find(id);
            if (tb_History == null)
            {
                return HttpNotFound();
            }
            return View(tb_History);
        }

        // GET: History/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: History/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NameSpace,Data")] tb_History tb_History)
        {
            if (ModelState.IsValid)
            {
                db.tb_History.Add(tb_History);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tb_History);
        }

        // GET: History/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_History tb_History = db.tb_History.Find(id);
            if (tb_History == null)
            {
                return HttpNotFound();
            }
            return View(tb_History);
        }

        // POST: History/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NameSpace,Data")] tb_History tb_History)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tb_History).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tb_History);
        }

        // GET: History/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_History tb_History = db.tb_History.Find(id);
            if (tb_History == null)
            {
                return HttpNotFound();
            }
            return View(tb_History);
        }

        // POST: History/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_History tb_History = db.tb_History.Find(id);
            db.tb_History.Remove(tb_History);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
