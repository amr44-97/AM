#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>
#include <SDL2/SDL_error.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_surface.h>
#include <SDL2/SDL_video.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_ttf.h>
#include <cstdlib>
#include <cstring>
#include <math.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>
#include <type_traits>
#include "la.h"
#include <math.h>
                


#define FONT_WIDTH 128
#define FONT_HEIGHT 64
#define FONT_COLS 18
#define FONT_ROWS 7
#define FONT_CHAR_WIDTH (FONT_WIDTH / FONT_COLS)
#define FONT_CHAR_HEIGHT (FONT_HEIGHT / FONT_ROWS)



void render_char(SDL_Renderer *renderer, TTF_Font *font,  
                 char  c,
                Vec2f pos, 
                SDL_Color color,
                float scale){
    
  //  const int index = c -32;
  //  const int col = index % FONT_COLS;
  //  const int row = index / FONT_COLS;

  //  
  //  const SDL_Rect src = (SDL_Rect){
  //      .x = col * FONT_CHAR_WIDTH,
  //      .y = row * FONT_CHAR_HEIGHT,
  //      .w = FONT_CHAR_WIDTH,
  //      .h = FONT_CHAR_HEIGHT 
  //  };

  //  const SDL_Rect dst = (SDL_Rect){
  //      .x = (int)  floorf(pos.x),
  //      .y = (int)  floorf(pos.y),
  //      .w = (int)  floorf(FONT_CHAR_WIDTH * scale),
  //      .h = (int)  floorf(FONT_CHAR_HEIGHT * scale),
  //  };


    
      SDL_Surface* glyph =   TTF_RenderGlyph_Solid(font, c, color);
   SDL_Texture*   texe = SDL_CreateTextureFromSurface(renderer, glyph);
    
      SDL_FreeSurface(glyph);

    SDL_Rect src = (SDL_Rect) {.x =40 , .y = 40, .w = 600, .h = 400};
    SDL_Rect dst = (SDL_Rect) {.x =40 , .y = 40, .w = glyph->w, .h = glyph->h};

    SDL_QueryTexture(texe,NULL,NULL , &dst.w, &dst.h);
        if(SDL_RenderCopy(renderer, texe, &src, &dst) != 0){
                fprintf(stderr,"[Error]: SDL_RenderCopy : %s\n", SDL_GetError());
            exit(1);
        }

}




void render_txt(SDL_Renderer *renderer, TTF_Font *fnt, 
                const char * txt,
                Vec2f pos,SDL_Color color,
                float scale){           
            
        size_t n = strlen(txt);     
        Vec2f pen = pos;
   
        for(size_t i = 0; i < n;++i)
            {
                render_char(renderer, fnt, txt[i], pos, color,  scale);
                pen.x += FONT_CHAR_WIDTH * scale; 

            }
}
