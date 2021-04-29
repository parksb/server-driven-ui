use crate::resolvers::screen;
use crate::schema::*;

pub fn screen(screen_type: ScreenType) -> Screen {
    Screen {
        components: get_screen_components(screen_type),
    }
}

fn get_screen_components(screen_type: ScreenType) -> Vec<ComponentValue> {
    match screen_type {
        ScreenType::Home => screen::home::components(),
        ScreenType::SignIn => screen::sign_in::components(),
    }
}
