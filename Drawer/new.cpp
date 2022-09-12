#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_surface.h>
#include <SDL2/SDL_ttf.h>
#include <SDL2/SDL_video.h>
#include <cstdlib>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
//#include "la.h"
//#include "render_text.hpp"

#include <string.h>
#include <string>
using namespace std;


#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600



SDL_Window* window;
SDL_Renderer* renderer;
SDL_Texture *texture, *text;
TTF_Font* font;
string input;
#define BUF_CAP 1024 *10
char* buffer =  ( char*) calloc(BUF_CAP , sizeof(char));
int buf_size = 0;





bool init();
void EndDrawing();
bool Draw();


bool Draw(){
    //static const unsigned char* keys = SDL_GetKeyboardState( NULL );

	SDL_Event event;
	SDL_Rect dest;
    SDL_SetRenderDrawColor(renderer, 0,0,0,0);
    SDL_RenderClear(renderer);

    while(SDL_PollEvent(&event)){
            switch (event.type) {
                case SDL_QUIT:
                    return false;
                case SDL_TEXTINPUT:
                    input += event.text.text;
                    break;
                case SDL_KEYDOWN:
                    switch (event.key.keysym.scancode) {
                        case SDL_SCANCODE_BACKSPACE:
                            printf("Backspace\n");
                            if(input.size() >= 1){
                                input.pop_back();
                            }
                            break;
                        case SDL_SCANCODE_Q:
                           printf("Exiting SDL\n");
                            return false;
                        default:{}
                                
                    }
                break;
            }    
    }


    SDL_Color fg= {255,255,255};
    if(input.size() >= 1){
        
        SDL_Surface *text_surf = TTF_RenderText_Solid(font,input.c_str(),  fg);

        text = SDL_CreateTextureFromSurface(renderer, text_surf);
        dest.x  = 0;//320 - (text_surf->w/2.0f);
        dest.y  = 0 ;
        dest.w = text_surf->w;
        dest.h = text_surf->h;
        
        SDL_RenderCopy(renderer, text, NULL, &dest);
        
        SDL_DestroyTexture(text);
        SDL_FreeSurface(text_surf);
        
    }
    SDL_RenderPresent(renderer);
    return true;
}




int main() {
  
    if(!init()){
        printf("Failed to initialize!!");
        exit(1);
    }

   while(Draw())
       ;
    EndDrawing();
    return 0;
}


bool init(){
  if (SDL_Init(SDL_INIT_EVERYTHING) < 0) {
    printf("[ERROR]: Failed to initialize SDL ...  %s\n", SDL_GetError());
    return false;
  } else {
    printf("SDL Initialized!\n");
  }
  
  if (TTF_Init() < 0) {
    printf("[ERROR]:Failed to initialize TTF ... %s\n", TTF_GetError());
    return false;
  } else {
    printf("TTF Initialized!\n");
  }
   
  window = SDL_CreateWindow("Example", SDL_WINDOWPOS_CENTERED,
                                     SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH,
                                     SCREEN_HEIGHT, SDL_WINDOW_RESIZABLE);

    if ( !window ) {
		printf("Error creating window: %s\n", SDL_GetError());
		return false;
	}


    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

     if ( !renderer ) {
		printf("Error creating Renderer: %s\n", SDL_GetError());
		return false;
	}


font = TTF_OpenFont("./fonts/Caskaydia Cove Regular Nerd Font Complete Mono.otf", 72);
	if ( !font ) {
		 printf("Error loading font: %s\n", TTF_GetError());
		return false;
	}


// Start sending SDL_TextInput events
	SDL_StartTextInput();

    return true;
}


void EndDrawing(){

    SDL_StopTextInput();

	TTF_CloseFont( font );
//	SDL_DestroyTexture( texture );
	texture = NULL;

	SDL_DestroyRenderer( renderer );
	SDL_DestroyWindow( window );
	window = NULL;
	renderer = NULL;

	TTF_Quit();
	SDL_Quit();


}



