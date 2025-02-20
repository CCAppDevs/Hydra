using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library
{
    public class Event
    {
        public int EventId { get; set; }
        public string Description { get; set; }
        public EventType Type { get; set; }
        public int CategoryId { get; set; }
        public DateTime Timestamp { get; set; }
        public string HostAddress { get; set; }
    }
}
