using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace exempleAPIRest
{
    internal class DB
    {
        private static string host = "localhost";
        private static string user = "root";
        private static string pwd = "";
        private static string db = "gestion_agricole";
        private static DB _instance = DB.Instance;
        private MySqlConnection _connection;
        private string _connectionString = $"Server={host};database={db};user={user};password={pwd};";

        private DB()
        {
            _connection = new MySqlConnection(_connectionString);
        }

        public static DB Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new DB();
                }
                return _instance;
            }
        }

        public MySqlConnection Connection
        {
            get { return _connection; }
        }

        public void OpenConnection()
        {
            if (_connection.State == System.Data.ConnectionState.Closed)
            {
                _connection.Open();
            }
        }

        public void CloseConnection()
        {
            if (_connection.State == System.Data.ConnectionState.Open)
            {
                _connection.Close();
            }
        }
    }
}
