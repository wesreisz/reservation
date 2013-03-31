using reservation_web.DAL;
using reservation_web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace reservation_web.Controllers
{
    public class ReservationController : ApiController
    {
        IReservationRepository repo = ReservationRepository.getRepository();
        public IEnumerable<Reservation> GetAllReservations()
        {
            return repo.GetAll();
        }
        public Reservation GetReservation(int id)
        {
            return repo.Get(id);
        }
        [HttpPost]
        public Reservation CreateReservation(Reservation item)
        {
            return repo.Add(item);
        }
        [HttpPut]
        public bool UpdateReservation(Reservation item)
        {
            return repo.Update(item);
        }
        public void DeleteReservation(int id)
        {
            repo.Remove(id);
        }
    }
}
