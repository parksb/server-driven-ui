use juniper::graphql_interface;
use juniper::FieldResult;
use juniper::{EmptySubscription, RootNode};
use juniper::{GraphQLEnum, GraphQLObject};

use crate::resolvers;

#[derive(GraphQLEnum)]
pub enum ScreenType {
    Home,
    SignIn,
}

#[derive(GraphQLObject)]
pub struct Screen {
    pub components: Vec<ComponentValue>,
}

#[graphql_interface(for = [AppBar, TextButton, TextField])]
pub trait Component {
    fn id(&self) -> i32;
}

#[derive(GraphQLObject)]
#[graphql(impl = ComponentValue)]
pub struct AppBar {
    pub title: String,
}

#[graphql_interface]
impl Component for AppBar {
    fn id(&self) -> i32 {
        0
    }
}

#[derive(GraphQLObject)]
#[graphql(impl = ComponentValue)]
pub struct TextButton {
    pub text: String,
    pub enabled: bool,
}

#[graphql_interface]
impl Component for TextButton {
    fn id(&self) -> i32 {
        1
    }
}

#[derive(GraphQLObject)]
#[graphql(impl = ComponentValue)]
pub struct TextField {
    pub label_text: String,
    pub placeholder: Option<String>,
    pub enabled: bool,
}

#[graphql_interface]
impl Component for TextField {
    fn id(&self) -> i32 {
        2
    }
}

pub struct QueryRoot;

#[juniper::graphql_object]
impl QueryRoot {
    fn screen(screen_type: ScreenType) -> FieldResult<Screen> {
        Ok(resolvers::screen::query::screen(screen_type))
    }
}

pub struct MutationRoot;

#[juniper::graphql_object]
impl MutationRoot {
    fn placeholder() -> FieldResult<bool> {
        Ok(true)
    }
}

pub type Schema = RootNode<'static, QueryRoot, MutationRoot, EmptySubscription>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot {}, MutationRoot {}, EmptySubscription::new())
}
