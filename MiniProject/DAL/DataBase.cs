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
        public SqlCommand cmd;
        public SqlConnection con;

        public SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-F0HK91ND;Initial Catalog=Project;Integrated Security=True");
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
            return (dt);
        }
        public DataTable GetDataTable(SortedList list, string query)
        {
            SqlCommand cmd = new SqlCommand(query, GetConnection());
            cmd.CommandType = CommandType.StoredProcedure;

            if (!(list.Count == 0))
            {
                string[] mKeys = new string[list.Count];
                list.Keys.CopyTo(mKeys, 0);
                int i = 0;
                for (i = 1; i <= list.Count; i++)
                {
                    cmd.Parameters.Add(new SqlParameter("@" + mKeys[i - 1], list[mKeys[i - 1]]));
                }
            }
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return (dt);
        }
        public object execscalar(string query)
        {
            SqlCommand cmd = new SqlCommand(query, GetConnection());
            Object s;
            s = cmd.ExecuteScalar();
            return s;
        }
        public int execquery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, GetConnection());
            return cmd.ExecuteNonQuery();
        }
        public string executeprocedure(SortedList list, string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, GetConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                if (!(list.Count == 0))
                {
                    string[] mKeys = new string[list.Count];
                    list.Keys.CopyTo(mKeys, 0);
                    int i = 0;
                    for (i = 1; i <= list.Count; i++)
                    {
                        cmd.Parameters.Add(new SqlParameter("@" + mKeys[i - 1], list[mKeys[i - 1]]));
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
