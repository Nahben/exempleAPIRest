using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace exempleAPIRest
{
    internal class ReqSQL
    {
        public static DB db = DB.Instance;

        public static List<object> Req1()
        {
            string query = "SELECT * FROM culture;";
            return ExecuteQuery(query);
        }

        public static List<object> Req2()
        {
            string query = "SELECT * FROM culture WHERE id_parcelle = '1';";
            return ExecuteQuery(query);
        }

        public static List<object> Req3()
        {
            string query = "SELECT * FROM culture WHERE qte_recoltee > 1;";
            return ExecuteQuery(query);
        }

        private static List<object> ExecuteQuery(string query)
        {
            var results = new List<object>();
            db.OpenConnection();

            MySqlCommand cmd = new MySqlCommand(query, db.Connection);
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var row = new Dictionary<string, object>();
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[reader.GetName(i)] = reader.GetValue(i);
                }
                results.Add(row);
            }

            reader.Close();
            db.CloseConnection();

            return results;
        }
    }
}
