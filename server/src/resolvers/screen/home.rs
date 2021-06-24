use crate::schema::*;

pub fn components() -> Vec<Component> {
    vec![
        Component::AppBar(AppBar {
            title: "Home".to_string(),
        }),
        Component::GridView(GridView {
            column_count: 2,
            children: vec![
                Component::Container(Container {
                    color: Color {
                        value: 0x80cbc4,
                        alpha: 0xff,
                    },
                    child: Box::new(Component::TextButton(TextButton {
                        text: "Sign in".to_string(),
                        route: Some("/sign_in".to_string()),
                    })),
                }),
                Component::Container(Container {
                    color: Color {
                        value: 0x80cbc4,
                        alpha: 0xff,
                    },
                    child: Box::new(Component::TextButton(TextButton {
                        text: "Sign up".to_string(),
                        route: None,
                    })),
                }),
            ],
        }),
    ]
}
