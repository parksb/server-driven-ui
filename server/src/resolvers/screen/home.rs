use crate::schema::*;

pub fn components() -> Vec<Component> {
    vec![
        Component::AppBar(AppBar {
            title: "Home".to_string(),
        }),
        Component::TextButton(TextButton {
            text: "Sign in".to_string(),
            route: Some("/sign_in".to_string()),
        }),
        Component::TextButton(TextButton {
            text: "Sign up".to_string(),
            route: None,
        }),
    ]
}
