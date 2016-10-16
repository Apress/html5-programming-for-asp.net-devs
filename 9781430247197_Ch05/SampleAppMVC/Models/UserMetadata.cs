using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace SampleAppMVC.Models
{
    public class UserMetadata
    {
        [Required]
        [StringLength(50,MinimumLength=3)]
        [DisplayName("Display Name")]
        public string DisplayName { get; set; }

        [Required]
        [StringLength(250, MinimumLength = 10)]
        [DisplayName("Email Address")]
        public string Email { get; set; }

        [Required]
        [StringLength(20, MinimumLength = 6)]
        public string Password { get; set; }

        [StringLength(50, MinimumLength = 10)]
        [DisplayName("Blog / Website")]
        public string BlogUrl { get; set; }

        [StringLength(500,ErrorMessage = "Bio size out of permissible limits.")]
        [DisplayName("Profile")]
        public string Bio { get; set; }

        [Required]
        [DisplayName("Legal Age")]
        public string Age { get; set; }

        [Required]
        [DisplayName("Yearly Income")]
        public string Income { get; set; }


    }

    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
    }
}