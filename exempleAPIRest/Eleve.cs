using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace exempleAPIRest
{
    internal class Eleve
    {
        private string _nom;
        private string _prenom;
        private DateOnly _dateNaissance;

        public Eleve(string nom, string prenom, DateOnly dateNaissance)
        {
            _nom = nom;
            _prenom = prenom;
            _dateNaissance = dateNaissance;
        }

        public string Nom { get => _nom; set => _nom = value; }
        public string Prenom { get => _prenom; set => _prenom = value; }
        public DateOnly DateNaissance { get => _dateNaissance; set => _dateNaissance = value; }
    }
    
}
