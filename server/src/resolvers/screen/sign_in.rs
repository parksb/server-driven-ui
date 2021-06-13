use crate::schema::*;

pub fn components() -> Vec<Component> {
    vec![
        Component::AppBar(AppBar {
            title: "Sign in".to_string(),
        }),
        Component::TextField(TextField {
            label_text: "Email".to_string(),
            enabled: true,
            placeholder: None,
        }),
        Component::TextField(TextField {
            label_text: "Password".to_string(),
            enabled: true,
            placeholder: None,
        }),
    ]
}
