using System.Net;
using System.Text;
using System.Text.Json;
using exempleAPIRest;

//HttpListener = Classe .NET permettant de communiquer via les protocoles HTTP
HttpListener listener = new HttpListener();
listener.Prefixes.Add("http://localhost:8080/");
listener.Start();
Console.WriteLine("Service web démarré sur http://localhost:8080");

//Attendre les requêtes
while (true)
{
    HttpListenerContext context = listener.GetContext();
    //On prend la file d'attente de toutes les requêtes, pour chaque requête on applique la fonction RequestHandler
    ThreadPool.QueueUserWorkItem(o=> RequestHandler(context));
}

//Recuperer et gerer une requete
static void RequestHandler(HttpListenerContext context)
{
    HttpListenerRequest request = context.Request;
    Console.WriteLine($"Requête reçue : {request.Url} Route : {request.Url.AbsolutePath}");

    // Initisalisation de la réponse par défaut
    List<object> data = new List<object>();
    data.Add(new {message = "Endpoint non trouvé"});

    //Vérifier l'URL pour déterminer l'endpoint
    switch (request.Url.AbsolutePath)
    {
        case "/Req1":
            data = ReqSQL.Req1();
            break;
        case "/Req2":
            data = ReqSQL.Req2();
            break;
    }

    Eleve eleve = new Eleve("Borgh", "Fatima", new DateOnly(1999,10,23));

    string jsonResponse = JsonSerializer.Serialize(data);

    //Creer la réponse
    byte[] responseBytes = Encoding.UTF8.GetBytes(jsonResponse);
    context.Response.ContentType = "application/json";
    context.Response.OutputStream.Write(responseBytes, 0, responseBytes.Length);
    context.Response.OutputStream.Close();
}