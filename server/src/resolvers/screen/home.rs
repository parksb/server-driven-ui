use crate::schema::*;

pub fn components() -> Vec<ComponentValue> {
    vec![
        ComponentValue::AppBar(AppBar {
            title: "Sign in".to_string(),
        }),
        ComponentValue::TextField(TextField {
            label_text: "Email".to_string(),
            enabled: true,
            placeholder: None,
        }),
        ComponentValue::TextField(TextField {
            label_text: "Password".to_string(),
            enabled: true,
            placeholder: None,
        }),
    ]
}
