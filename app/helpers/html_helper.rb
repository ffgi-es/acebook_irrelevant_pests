module HtmlHelper
  def nav_bar(current_user)
    content_tag :div, class: ["ui", "fixed", "inverted", "menu"] do
      content_tag :div, class: ["ui", "container"] do

        concat(link_to(image_tag("acebook_logo.png", class: "logo", id: "home") + "Acebook", "/", class: "item")) 
        
        concat content_tag(:div, class: ["right", "item"]) {
          if !current_user
            link_to("Log in", "/sessions/new", class: "item") +
            link_to("Sign up", "/users/new", class: "item")
          else
            link_to("Welcome #{current_user.first_name}!", "/#{current_user.id}", class: "item") +
            link_to('Log out', "/sessions/null", method: :delete, class: "item")
          end
        }
      end
    end
  end

  def footer
    content_tag :div, class: ["ui", "inverted", "vertical", "footer", "segment"] do
      content_tag :div, class: ["ui", "center", "aligned", "container"] do
        concat content_tag(:div, class: ["ui", "stackable", "inverted", "divided", "grid"]) {
          concat content_tag(:div, class: ["six", "wide", "column"]) {
            concat(content_tag(:h4, "Here are the Creators", class: ["ui" "inverted" "header"]))
            concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
              content_tag(:span, "You can check us out on GitHub")
            }
          }
          concat content_tag(:div, class: ["two", "wide", "column"]) {
            concat(content_tag(:h4, "Alastair Gilles", class: ["ui" "inverted" "header"]))
            concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
              link_to "GitHub", "https://github.com/ffgi-es", class: "item"
            }
          }
          concat content_tag(:div, class: ["two", "wide", "column"]) {
            concat(content_tag(:h4, "Hisham Bokhari", class: ["ui" "inverted" "header"]))
            concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
              link_to "GitHub", "https://github.com/hishambokhari", class: "item"
            }
          }
          concat content_tag(:div, class: ["two", "wide", "column"]) {
            concat(content_tag(:h4, "Jonathan Palma", class: ["ui" "inverted" "header"]))
            concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
              link_to "GitHub", "https://github.com/JonathanPalma-code", class: "item"
            }
          }
          concat content_tag(:div, class: ["two", "wide", "column"]) {
            concat(content_tag(:h4, "Kealan Heena", class: ["ui" "inverted" "header"]))
            concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
              link_to "GitHub", "https://github.com/kealanheena", class: "item"
            }
          }
          concat content_tag(:div, class: ["two", "wide", "column"]) {
            concat(content_tag(:h4, "Sam Folorunsho", class: ["ui" "inverted" "header"]))
            concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
              link_to "GitHub", "https://github.com/samfolo", class: "item"
            }
          }
        }
        
        concat content_tag(:div, nil, class: ["ui", "inverted", "section", "divider"])
        concat(image_tag "acebook_logo.png", class: "ui centered mini image")

        concat content_tag(:div, class: ["ui", "horizontal", "inverted", "small", "divided", "link", "list"]) {
          link_to "Terms and Conditions", "#", class: "item"
          link_to "Privacy Policy", "#", class: "item"
        }
      end
    end
  end
end
