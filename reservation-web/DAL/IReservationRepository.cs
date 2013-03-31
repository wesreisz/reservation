using reservation_web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace reservation_web.DAL
{
    public interface IReservationRepository
    {
        IEnumerable<Reservation> GetAll();
        Reservation Get(int id);
        Reservation Add(Reservation item);
        void Remove(int id);
        bool Update(Reservation item);
    }
}