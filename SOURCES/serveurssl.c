#include <errno.h>
#include <unistd.h>
#include <malloc.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <resolv.h>
#include <pthread.h>
#include "fonction_serveur.h"
#include "chaine.h"
 
#define FAIL    -1
 
int OpenListener(int port)
{   int sd;
    struct sockaddr_in addr;
 
    sd = socket(PF_INET, SOCK_STREAM, 0);
    bzero(&addr, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);
    addr.sin_addr.s_addr = INADDR_ANY;
    if ( bind(sd, (struct sockaddr*)&addr, sizeof(addr)) != 0 )
    {
        perror("Bind Impossible");
        abort();
    }
    if ( listen(sd, 10) != 0 )
    {
        perror("Impossible de configurer le port d'écoute \n");
        abort();
    }
    return sd;
}
 
int isRoot()
{
    if (getuid() != 0)
    {
        return 0;
    }
    else
    {
        return 1;
    }
 
}
SSL_CTX* InitServerCTX(void)
{   SSL_METHOD *method;
    SSL_CTX *ctx;
 
    OpenSSL_add_all_algorithms();  /* load & register all cryptos, etc. */
    SSL_load_error_strings();   /* load all error messages */
    method = TLSv1_2_server_method();  /* create new server-method instance */
    ctx = SSL_CTX_new(method);   /* create new context from method */
    if ( ctx == NULL )
    {
        ERR_print_errors_fp(stderr);
        abort();
    }
    return ctx;
}
 
void LoadCertificates(SSL_CTX* ctx, char* CertFile, char* KeyFile)
{
    /*if (SSL_CTX_load_verify_locations(ctx, CertFile, KeyFile) != 1)
        ERR_print_errors_fp(stderr);

    if (SSL_CTX_set_default_verify_paths(ctx) != 1)
        ERR_print_errors_fp(stderr);*/
    
    /* set the local certificate from CertFile */
    if ( SSL_CTX_use_certificate_file(ctx, CertFile, SSL_FILETYPE_PEM) <= 0 )
    {
        ERR_print_errors_fp(stderr);
        abort();
    }
    /* set the private key from KeyFile (may be the same as CertFile) */
    if ( SSL_CTX_use_PrivateKey_file(ctx, KeyFile, SSL_FILETYPE_PEM) <= 0 )
    {
        ERR_print_errors_fp(stderr);
        abort();
    }
    /* verify private key */
    if ( !SSL_CTX_check_private_key(ctx) )
    {
        fprintf(stderr, "La clé privée ne correspond pas au certificat public \n");
        abort();
    }
    
    /*SSL_CTX_set_verify(ctx, SSL_VERIFY_PEER | SSL_VERIFY_FAIL_IF_NO_PEER_CERT, NULL);
    SSL_CTX_set_verify_depth(ctx, 4);*/
}
 
void ShowCerts(SSL* ssl)
{   X509 *cert;
    char *line;
 
    cert = SSL_get_peer_certificate(ssl); /* Get certificates (if available) */
    if ( cert != NULL )
    {
        printf("Certificats serveur:\n");
        line = X509_NAME_oneline(X509_get_subject_name(cert), 0, 0);
        printf("Subject: %s\n", line);
        free(line);
        line = X509_NAME_oneline(X509_get_issuer_name(cert), 0, 0);
        printf("Issuer: %s\n", line);
        free(line);
        X509_free(cert);
    }
    else
        printf("Client simple sans certificat\n");
}
 
void Servlet(SSL* ssl) /* Serve the connection -- threadable */ // succède à "connection_handler"
{   char buf[1024];
    char cmd[200];
    char reply[1024];
    int sd, bytes;
    //const char* HTMLecho="modifié \n";
 
    if ( SSL_accept(ssl) == FAIL )     /* do SSL-protocol accept */
        ERR_print_errors_fp(stderr);
    else
    {
        ShowCerts(ssl);        /* get any certificates */
        //bytes = SSL_read(ssl, buf, sizeof(buf)); /* get request */ // chercher le segfault ici
        do
	{
	  bytes = SSL_read(ssl, buf, sizeof(buf));
	  if ( bytes > 0 )
	  {
	      buf[bytes] = 0;
	      printf("Client msg: \"%s\"\n", buf);
	      //sprintf(reply, "reçu \n", buf);   /* construct reply */
	      //SSL_write(ssl, reply, strlen(reply)); /* send reply */
	      if((delete_end_char(cmd,sizeof(cmd),buf))==-1)
	      {
		perror("Erreur supression caractère de fin!");
		break;
	      }
	      function_to_select(ssl, cmd);
	      //bytes = SSL_read(ssl, buf, sizeof(buf));
	  }
	  else
	  {
	      ERR_print_errors_fp(stderr);
	      break;
	  }
	  bzero(buf,1024);
	  bzero(cmd,200);
	      
	}
	while(bytes > 0);
    }
    sd = SSL_get_fd(ssl);       /* get socket connection */
    SSL_free(ssl);         /* release SSL state */
    close(sd);          /* close connection */
}
 
int main(int count, char *strings[])
{   SSL_CTX *ctx;
    int server, *new_sock;
    char *portnum;
 
    if(!isRoot())
    {
        printf("Ce programme doit être executé en contexte root/sudo \n");
        exit(0);
    }
    if ( count != 2 )
    {
        printf("Syntaxe: %s <portnum>\n", strings[0]);
        exit(0);
    }
    SSL_library_init();
 
    portnum = strings[1];
    ctx = InitServerCTX();        /* initialize SSL */
    LoadCertificates(ctx, "server.cert", "server.pem"); /* load certs */
    server = OpenListener(atoi(portnum));    /* create server socket */

    struct sockaddr_in addr;
    socklen_t len = sizeof(addr);
    SSL *ssl;
    int client;
 
        while ( (client = accept(server, (struct sockaddr*)&addr, &len)) )
	{/* accept connection as usual */
	  printf("Connection: %s: %d\n",inet_ntoa(addr.sin_addr), ntohs(addr.sin_port));
	  ssl = SSL_new(ctx);              /* get new SSL state with context */
	  SSL_set_fd(ssl, client);      /* set connection socket to SSL state */
	  ShowCerts(ssl);
	  pthread_t sniffer_thread;
	  /*new_ssl = malloc(1);
	  *new_sock = client;*/
	  
	  if( (pthread_create( &sniffer_thread , NULL ,  (void*)(Servlet) , (void*) ssl)) < 0)
	  {
	      perror("Impossible de créer un thread");
	      return 1;
	  }
	  //Servlet(ssl);/* service connection */
	}
    
    close(server);          /* close server socket */
    SSL_CTX_free(ctx);
    return 0; /* release context */
 }