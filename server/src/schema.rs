use derive_more::From;
use juniper::{EmptySubscription, FieldResult, RootNode};
use juniper::{GraphQLEnum, GraphQLObject, GraphQLUnion};

use crate::resolvers;

#[derive(GraphQLEnum)]
pub enum ScreenType {
    Home,
    SignIn,
}

#[derive(GraphQLObject)]
pub struct Screen {
    pub components: Vec<Component>,
}

#[derive(From, GraphQLUnion)]
pub enum Component {
    AppBar(AppBar),
    TextButton(TextButton),
    TextField(TextField),
    GridView(GridView),
    Container(Container),
    Column(Column),
}

// +------------+
// | Components |
// +------------+

#[derive(GraphQLObject)]
pub struct AppBar {
    pub title: String,
}

#[derive(GraphQLObject)]
pub struct TextButton {
    pub text: String,
    pub route: Option<String>,
}

#[derive(GraphQLObject)]
pub struct TextField {
    pub label_text: String,
    pub placeholder: Option<String>,
    pub enabled: bool,
}

#[derive(GraphQLObject)]
pub struct GridView {
    pub column_count: i32,
    pub children: Vec<Component>,
}

#[derive(GraphQLObject)]
pub struct Container {
    pub padding: i32,
    pub color: Option<Color>,
    pub child: Box<Component>,
}

#[derive(GraphQLObject)]
pub struct Column {
    pub children: Vec<Component>,
}

#[derive(GraphQLObject)]
pub struct Color {
    pub value: i32,
    pub alpha: i32,
}

// +---------+
// | Queries |
// +---------+

pub struct QueryRoot;

#[juniper::graphql_object]
impl QueryRoot {
    fn screen(screen_type: ScreenType) -> FieldResult<Screen> {
        Ok(resolvers::screen::query::screen(screen_type))
    }
}

// +-----------+
// | Mutations |
// +-----------+

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
