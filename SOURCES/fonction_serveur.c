#include "fonction_serveur.h"
#include "fonction_client_on_serveur.h"
#include "chaine.h"
#include <openssl/bio.h>
#include <openssl/conf.h>
#include <openssl/evp.h>
//#include <openssl/ssl.h>
//#include <openssl/err.h>



int function_to_select(SSL *ssl, char *cmd, int*log)
{
   printf("Fonction de choix de la commande IN\n");

   char *message;
   char *file;
   int ret;
   char cat[2048];
   char *cmd_f;
   FILE *to_send;
   char buf[1024];
   //char *cmd2;
   char vim_pass[] = "password"; // saisir le mot de passe du compte de la machine serveur qui execute vim
   char commande_f[50];
   int error;
   printf("La cmd est %s\n",cmd);

   message = " est votre commande\n";
   strcpy(commande_f ,cmd);
   
   if(strcmp(cmd,"") == 0)
   {
      message = "Aucune commande saisie.\nEntrez une commande valide.\n";
      SSL_write(ssl , message , strlen(message));
      printf("Fonction de choix de la commande OUT\n");
      return -1;
   }

   else if(strcmp(cmd,"auth") == 0)
   {
      printf("Authentification IN\n");
      authentification_function(ssl,log);
      printf("Authentification OUT\n");
      printf("Fonction de choix de la commande OUT\n");

      return 0;  
   }
   else if(strcmp(cmd,"deauth") == 0)
   {
      printf("Deauthentification IN\n");
      deauth_function(ssl,log);
      printf("Deauthentification OUT\n");
      SSL_write(ssl,"Deco realisee\n",strlen("Deco realisee\n"));
      printf("Fonction de choix de la commande OUT\n");

      return 0;  
   }
   else if(strcmp(cmd,"insc") == 0)
   {
      printf("Inscription IN\n");
      error = inscription_function(ssl);
      if(error == -1)
      {
         message = "Inscription impossible, compte existant!\n";
         SSL_write(ssl , message , strlen(message));
         printf("Inscription OUT\n");
         printf("Fonction de choix de la commande OUT\n");
         return -1;
      }
      message = "Inscription realisee avec succes!\n";
      SSL_write(ssl , message , strlen(message));
      printf("Inscription OUT\n");
      printf("Fonction de choix de la commande OUT\n");

      return 0;
   }
   else if(strcmp(cmd,"help") == 0)
   {
      printf("Aide IN\n");
      message = "Bonjour!\n1- auth pour authentifier\n2- deauth pour de loger\n3- insc pour inscrire\n4- help pour afficher l'aide\n5- quit pour quitter le serveur\nBonne navigation\n";
      SSL_write(ssl , message , strlen(message));
      printf("Aide OUT\n");
      printf("Fonction de choix de la commande OUT\n");
      return 0;
   }
   else if(strcmp(cmd,"quit") == 0)
   {
      printf("Quitter IN\n");
      quit_function(ssl);
      printf("Quitter OUT\n");
      printf("Fonction de choix de la commande OUT\n");
      return 0;
   }
   else if((*(log)) == 1){
      cmd_f = strtok(cmd," ");
      if(strcmp(cmd_f,"ls") == 0)
      {
         printf("Ls serveur\n");
	 bzero(cat,2048);
	 printf("Commande_f: %s\n",commande_f);
         if (( to_send = popen(commande_f, "r")) == NULL)
         {
            perror("popen");
            exit(1);
         }
         while(fgets(buf, sizeof(buf), to_send))
         {
            strcat(cat,buf);
            
         }
         SSL_write(ssl , cat , strlen(cat));
         
         pclose(to_send);
         
      }
      else if(strcmp(cmd_f,"dl") == 0)
      {
         printf("Dl serveur\n");
	 message = "Fichier dl\n";
	 file = strtok(NULL," ");
	 printf("File à DL: %s\n",file);
         SSL_write(ssl , message , strlen(message));
      }
      else if(strcmp(cmd_f,"mkdir") == 0)
      {
         printf("Mkdir serveur\n");
         system(commande_f);
	 message = "Fichier créé\n";
         SSL_write(ssl , message , strlen(message));
      }
      else if(strcmp(cmd_f,"cd") == 0)
      {
         printf("Cd serveur\n");
	 file = strtok(NULL," ");
         chdir(file);
    	 execvp("cd",(char * const*)file);
	 message = "Cd effectué\n";
         SSL_write(ssl , message , strlen(message));
      }
      else if(strcmp(cmd_f,"rm") == 0)
      {
         printf("Rm serveur\n");
         ret = system(commande_f);
         if(ret == -1){
            perror("Erreur rm");
	    return EXIT_FAILURE;
         }
	 else
         {
            message = "Fichier supprimé\n";
            SSL_write(ssl , message , strlen(message));
      	 }
      }
      else if(strcmp(cmd_f,"cp") == 0)
      {
         printf("Cp serveur\n");
         system(commande_f);
	 message = "Copie effectuée\n";
         SSL_write(ssl , message , strlen(message));
      }
      else if(strcmp(cmd_f,"touch") == 0)
      {
         printf("Touch serveur\n");
         system(commande_f);
	 message = "Fichier créé\n";
         SSL_write(ssl , message , strlen(message));
      }
      
      else if(strcmp(cmd_f,"vim") == 0)
      {
	printf("\n vim serveur \n");
	SSL_write(ssl, vim_pass, strlen(vim_pass));
      }
      else
      {
         message = "Entrez une commande valide.\n";
         SSL_write(ssl , message , strlen(message));
      }

	}
   else{
      message = "Veuillez vous authentifier..\n";
      SSL_write(ssl , message , strlen(message));
      printf("Fonction de choix de la commande OUT\n");
      bzero(cat,2048);
      bzero(buf,1024);
      bzero(commande_f,50);
   }
	
      

      return -1;

}


