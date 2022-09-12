#ifndef _RENDER_TXT_H
#define _RENDER_TXT_H

void render_char(SDL_Renderer *renderer, TTF_Font *font,
                 char  c,
                Vec2f pos, 
                SDL_Color color,
                float scale);



void render_txt(SDL_Renderer *renderer, TTF_Font *fnt,  
                const char * txt,
                Vec2f pos,SDL_Color color,
                float scale);





#endif // _RENDER_TXT_H
