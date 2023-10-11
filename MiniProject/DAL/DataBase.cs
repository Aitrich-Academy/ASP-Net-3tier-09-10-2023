using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DataBase
    {
        private SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection("Data Source=ASHILYMARIYA;Initial Catalog=Project;Integrated Security=True");

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            con.Open();
            return con;
        }

        public DataTable GetDataTable(string query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(query, GetConnection());
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

        public DataTable GetDataTable(SortedList list, string query)
        {
            SqlCommand cmd = new SqlCommand(query, GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;

            if (list.Count > 0)
            {
                foreach (DictionaryEntry entry in list)
                {
                    cmd.Parameters.Add(new SqlParameter("@" + entry.Key, entry.Value));
                }
            }

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

        public object ExecScalar(string query)
        {
            SqlCommand cmd = new SqlCommand(query, GetConnection());
            return cmd.ExecuteScalar();
        }

        public int ExecQuery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, GetConnection());
            return cmd.ExecuteNonQuery();
        }

        public string ExecuteProcedure(SortedList list, string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, GetConnection());
                cmd.CommandType = CommandType.StoredProcedure;

                if (list.Count > 0)
                {
                    foreach (DictionaryEntry entry in list)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + entry.Key, entry.Value));
                    }
                }

                return cmd.ExecuteScalar().ToString();
            }
            catch (Exception e)
            {
                return "-1";
            }
            finally
            {
                if (GetConnection().State == ConnectionState.Open)
                {
                    GetConnection().Close();
                }
            }
        }
    }
}