using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

using MvcApplication1.Models;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace MvcApplication1.DAL
{
    public class Fishing4Context: DbContext
    {
        public Fishing4Context()
            : base("fishing4Entities")
        {
        }

        public DbSet<ADDRESS> ADDRESSES { get; set; }
        public DbSet<BLOG> BLOGE { get; set; }
        public DbSet<ORDER_ADDRESS> ORDER_ADDRESSS { get; set; }
        public DbSet<ORDER_DETAIL> ORDER_DETAILS { get; set; }
        public DbSet<ORDER_PAYMENT> ORDER_PAYMENTS { get; set; }
        public DbSet<ORDER_PRODUCT> ORDER_PRODUCTS { get; set; }
        public DbSet<PAYMENT> PAYMENTS { get; set; }
        public DbSet<PRODUCT> PRODUCTS { get; set; }

        public DbSet<RATING> RATINGS { get; set; }

        public DbSet<USER> USERS { get; set; }
        public DbSet<USER_ROLE> USER_ROLES { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}