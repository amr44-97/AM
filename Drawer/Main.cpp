#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_surface.h>
#include <SDL2/SDL_video.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_ttf.h>
#include <cstdlib>
#include <cstring>
#include <stdlib.h>
#include <stdio.h>
#include "la.h"
#include "render_text.hpp"

#include<string.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600



void DrawText(SDL_Renderer* rend,SDL_Texture *texeture , SDL_Rect * dest, SDL_Surface *surf, TTF_Font* font,char * buf ){
       surf =  TTF_RenderText_Blended(font,buf , {255,255,255,0});
    printf("Buffer = %s\n", buf);
       //   src = (SDL_Rect) {.x =0 , .y = 0, .w = 800, .h = 600};
 //   dest = (SDL_Rect) {.x =0 , .y = 0, .w = surf->w, .h = surf->h};

    texeture = SDL_CreateTextureFromSurface(rend, surf);
    SDL_FreeSurface(surf);
    SDL_QueryTexture(texeture,NULL,NULL , &dest->w , &dest->y);
}



int main(){
#define  BUF_CAP 1024*1024
 char buffer[BUF_CAP]  ;//= ( char*) calloc(BUF_CAP , sizeof(unsigned char));
int buf_size =0;


  if(SDL_Init(SDL_INIT_EVERYTHING) != 0) {
    printf("ERROR: %s\n",SDL_GetError());
    exit(1);
  }else {
       printf("SDL Initialized!\n");
  }

 SDL_Window* win =  SDL_CreateWindow("Iam SDL Here!!", SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT , SDL_WINDOW_RESIZABLE);
 SDL_Renderer *rend = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED);
    

    if(TTF_Init() == -1){
            printf("ERROR: %s\n",TTF_GetError());
            exit(1);
    }else {
       printf("TTF Initialized!\n");
    }



    SDL_Surface* surf;
    TTF_Font* fnt = TTF_OpenFont("./fonts/Caskaydia Cove Regular Nerd Font Complete Mono.otf", 32);
    if(fnt == NULL){
        printf("[ERROR]: Couldn't Load Font!!\n");
    }

   surf =  TTF_RenderText_Solid(fnt,"Hello Assembly Hello ", {255,255,255,0});
        //IMG_Load("pics/219407.png");

   

    //SDL_Surface *glyph = surf ;  //TTF_RenderText_Solid(fnt,'A', {255,255,255,0});
    SDL_Texture* tex = SDL_CreateTextureFromSurface(rend, surf);
 //   SDL_FreeSurface(surf);
    

    SDL_Rect dest = (SDL_Rect) {.x =0  , .y = 0, .w =1920, .h = 1080};
    //SDL_Rect dest = (SDL_Rect) {.x =0  , .y = 0, .w =32, .h = 32};
    SDL_Rect src = (SDL_Rect) {.x =0 , .y = 0, .w = surf->w, .h = surf->h};
  //  SDL_QueryTexture(tex,NULL,NULL , &dest.w, &dest.h);




    int speed =300;
 
 bool Stop = false;

 while (!Stop) {
    SDL_Event e;
    while(SDL_PollEvent(&e)){
            switch (e.type) {
                case SDL_QUIT:{
                            Stop = true;
                              }
                        break;
               case SDL_TEXTINPUT: 
                    {
                        size_t text_size = strlen(e.text.text);
                        const size_t free_space = BUF_CAP - buf_size;
                        if(text_size > free_space){
                            text_size  = free_space;
                        }
                        memcpy(buffer + buf_size, e.text.text , text_size);
                        buf_size += text_size;

                    } 
                    break;
               case SDL_KEYDOWN:{
                                switch (e.key.keysym.scancode) {
                            case SDL_SCANCODE_Q:
                                Stop = true;
                                printf("Exit Screen\n");
                                break;
                                //surf = IMG_Load("pics/pexels-dominykas-4411214.jpg");
                                //tex = SDL_CreateTextureFromSurface(rend, surf);
                              //  SDL_FreeSurface(surf);
                              //  SDL_QueryTexture(tex,NULL,NULL , &dest.w, &dest.h);
                            case SDL_SCANCODE_BACKSPACE:
                                if(buf_size < 1){break;}
                                memset(buffer + buf_size-1 ,0, 1);
                                buf_size -=1;
                                printf("Backspace Screen\n");
                                break;
                            
                            default:
                            //    printf("Other Keypressed!!\n");
                                break;
                        }

                    }break;
                                   
                    }
  // clears the screen
  //
    }
       surf =  TTF_RenderText_Blended(fnt,buffer , {255,255,255,0});
 //   printf("Buffer = %s\n", buffer);
  //     //   src = (SDL_Rect) {.x =0 , .y = 0, .w = 800, .h = 600};
  //    //   dest = (SDL_Rect) {.x =0 , .y = 0, .w = surf->w, .h = surf->h};

    SDL_Texture* tex = SDL_CreateTextureFromSurface(rend, surf);
    SDL_FreeSurface(surf);
    SDL_QueryTexture(tex,NULL,NULL , &dest.w, &dest.h);
    //SDL_QueryTexture(tex,NULL,NULL , 32, 32);
  

    //DrawText(rend,tex,surf, &dest, surf,fnt, &buffer );
 //   DrawText(rend, tex, &dest, surf, fnt, buffer);
    
            SDL_RenderClear(rend);     
   //     render_txt(rend, fnt ,"Hello aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaWorld", vec2f(0.0,0.0),{255,255,255,0}, 5.0f);


         SDL_RenderCopy(rend, tex, &dest, &dest);
 
        // triggers the double buffers
        // for multiple rendering
        SDL_RenderPresent(rend);





 //       SDL_SetRenderDrawColor(rend, 0, 0, 0, 0);
 //
     }
 


 SDL_DestroyRenderer(rend);
 SDL_DestroyWindow(win);   
 SDL_Quit();

}


