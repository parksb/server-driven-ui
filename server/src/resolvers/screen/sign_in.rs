use crate::schema::*;

pub fn components() -> Vec<ComponentValue> {
    vec![
        ComponentValue::AppBar(AppBar {
            title: "Home".to_string(),
        }),
        ComponentValue::TextButton(TextButton {
            text: "Sign in".to_string(),
            enabled: true,
        }),
        ComponentValue::TextButton(TextButton {
            text: "Sign up".to_string(),
            enabled: false,
        }),
    ]
}
