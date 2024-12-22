#include <stdio.h>
#include <SDL2/SDL.h>

int main()
{
	if(SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		printf("ERREUR SDL : %s\n",SDL_GetError());
		return 1;
	}
	printf("Initialisation réalisée avec succès\n");
	SDL_Window* fenetre = NULL;
	fenetre = SDL_CreateWindow("Fenetre GAMECRASH",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,640,480,SDL_WINDOW_SHOWN);

	if(fenetre)
	{
		SDL_Delay(3000);
		SDL_DestroyWindow(fenetre);
	}
	else
	{
		fprintf(stderr,"Erreur de creation de la fenetre : %s\n",SDL_GetError());
	}
	SDL_Quit();
	return 0;
}
