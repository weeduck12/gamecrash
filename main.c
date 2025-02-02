#include <stdio.h>
#include <SDL2/SDL.h>
#include <stdbool.h>
#include <SDL2/SDL_image.h>
int main()
{
//INITIALISATION DE LA VIDEO 
	if(SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		printf("ERREUR SDL : %s\n",SDL_GetError());
		return 1;
	}
	printf("Le programme s'est lancé sans problème\n");
//INIT IMG
	if (!(IMG_Init(IMG_INIT_PNG) & IMG_INIT_PNG)) 
	{
        printf("Erreur IMG_Init: %s\n", IMG_GetError());
        SDL_Quit();
        return 1;
        }
//CREATION DE LA FENETRE & RENDU & SURFACE 
	SDL_Window* fenetre = NULL;
	fenetre = SDL_CreateWindow("Fenetre GAMECRASH",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,640,480,SDL_WINDOW_SHOWN);
	SDL_Renderer* rendu = SDL_CreateRenderer(fenetre,-1,SDL_RENDERER_ACCELERATED);
	SDL_Surface* surface = IMG_Load("plateau.png");
	SDL_Texture* texture = SDL_CreateTextureFromSurface(rendu, surface);
	SDL_Surface* pions = IMG_Load("pions.png");
        SDL_Texture* texturepions = SDL_CreateTextureFromSurface(rendu, pions);
	SDL_FreeSurface(surface);
	SDL_FreeSurface(pions);
//DECLARATIONS 
	SDL_Event event;
	SDL_Rect pion = {1500, 450, 200, 300};
	SDL_Rect place_pion = {50, 875,140 ,140};
//LOOP
	bool run = true;
	while(run){
		while(SDL_PollEvent(&event)){
	if(event.type == SDL_QUIT)
	{
		run = false;
	}
		}
	//RENDU
	SDL_SetRenderDrawColor(rendu, 0, 0, 0, 255);
        SDL_RenderClear(rendu);
        SDL_RenderCopy(rendu, texture, NULL, NULL);
	SDL_RenderCopy(rendu, texturepions, &pion, &place_pion);
        SDL_RenderPresent(rendu);
	//
	}
	//FERMETURE
	SDL_DestroyTexture(texture);
	SDL_DestroyTexture(texturepions);
	SDL_DestroyRenderer(rendu);
	SDL_DestroyWindow(fenetre);
	SDL_Quit();
	return 0;
	//
}
