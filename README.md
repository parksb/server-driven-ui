# Server Driven UI Demo

* Server Driven UI(SDUI)는 서버에서 클라이언트의 UI 컴포넌트를 관리하는 방식.
* 클라이언트 배포없이 API 응답을 변경하는 것만으로 UI 변경이 가능한 동시에 하위 호환성을 확보할 수 있다.
* Rust, GraphQL, Flutter로 간단히 동작하는 SDUI 데모를 구현한다:
  * Flutter의 체계적인 위젯 시스템이 UI 컴포넌트 개념에 부합한다.
  * flutter/material 라이브러리가 material design system을 높은 수준으로 구현하고 있어 스키마 디자인이 수월하다.
  * GraphQL은 재사용 가능한 fragment를 지원하기 때문에 컴포넌트 인터페이스를 주고받기 적합하다.

## Description

* 스크린(화면을 구성하는 가장 큰 단위) 안에 다양한 컴포넌트가 배치된다.
* `screenType` 인자로 화면 유형을 선택하면 서버가 해당 화면에 맞는 컴포넌트를 응답한다.
* 각 컴포넌트는 `Component` 인터페이스를 구현하며, `screen.components` 필드는 `[Component!]!`를 반환한다.
* 클라이언트는 사용 가능한 모든 컴포넌트를 요청하며, 응답받은 컴포넌트의 `__typename`과 위젯을 매핑한다.

### Home

```graphql
query getScreen {
  screen(screenType: HOME) {
    components {
      ... on AppBar {
        __typename
        title
      }
      ... on TextField {
        __typename
        labelText
        placeholder
        enabled
      }
      ... on TextButton {
        __typename
        text
        route
      }
    }
  }
}
```

```json
{
  "data": {
    "screen": {
      "components": [
        {
          "__typename": "AppBar",
          "title": "Home"
        },
        {
          "__typename": "TextButton",
          "text": "Sign in",
          "route": "/sign_in"
        },
        {
          "__typename": "TextButton",
          "text": "Sign up",
          "route": null
        }
      ]
    }
  }
}
```

### Sign in

```graphql
query getScreen {
  screen(screenType: SIGN_IN) {
    components {
      ... on AppBar {
        __typename
        title
      }
      ... on TextField {
        __typename
        labelText
        placeholder
        enabled
      }
      ... on TextButton {
        __typename
        text
        route
      }
    }
  }
}
```

```json
{
  "data": {
    "screen": {
      "components": [
        {
          "__typename": "AppBar",
          "title": "Sign in"
        },
        {
          "__typename": "TextField",
          "labelText": "Email",
          "placeholder": null,
          "enabled": true
        },
        {
          "__typename": "TextField",
          "labelText": "Password",
          "placeholder": null,
          "enabled": true
        }
      ]
    }
  }
}
```

## Future work

* [ ] 클라이언트 타이핑 고도화
* [ ] 컴포넌트 스타일 고도화
* [ ] 중첩 컴포넌트
* [ ] 컴포넌트 페이지네이션
* [ ] 특정 컴포넌트 리로딩

## References

* [박호준, "GraphQL이 가져온 에어비앤비 프론트앤드 기술의 변천사", DEVIEW 2020, 2020.](https://deview.kr/2020/sessions/337)
* [김도훈, "Server Driven UI (Feat.Flutter)", 2020.](https://medium.com/@kimdohun0104/server-driven-ui-feat-flutter-87fcbb04e610)
* [Tom Lokhorst, "Server Driven UI", Tom Lokhorst's blog, 2020.](http://tom.lokhorst.eu/2020/07/server-driven-ui)

## License

This project is distributed under the MIT License - see the [LICENSE](LICENSE) file for details.
