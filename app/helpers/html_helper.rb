module HtmlHelper
  def nav_bar(current_user)
    content_tag :div, class: ["ui", "fixed", "inverted", "menu"] do
      content_tag :div, class: ["ui", "container"] do
        concat(link_to(image_tag("acebook_logo.png", class: "logo", id: "home") + 
        "Acebook", "/", class: "item"))        
        concat content_tag(:div, class: ["right", "item"]) {
          nav_if_else(current_user)
        }
      end
    end
  end

  def nav_if_else(current_user)
    if !current_user
      link_to("Log in", "/sessions/new", class: "item") +
      link_to("Sign up", "/users/new", class: "item")
    else
      link_to("Welcome #{current_user.first_name}!", "/#{current_user.id}", class: "item") +
      link_to('Log out', "/sessions/null", method: :delete, class: "item")
    end
  end

  def footer
    content_tag :div, class: ["ui", "inverted", "vertical", "footer", "segment"] do
      content_tag :div, class: ["ui", "center", "aligned", "container"] do
        concat content_tag(:div, class: ["ui", "stackable", "inverted", "divided", "grid"]) {
          footer_links
        }
        footer_end
      end
    end
  end

  def footer_link_description
    concat content_tag(:div, class: ["six", "wide", "column"]) {
      concat(content_tag(:h4, "Here are the Creators", class: ["ui", "inverted", "header"]))
      concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
        content_tag(:span, "You can check us out on GitHub")
      }
    } 
  end

  def footer_links
    footer_link_description         
    footer_link_list("Alastair Gilles", "https://github.com/ffgi-es")
    footer_link_list("Hisham Bokhari", "https://github.com/hishambokhari")
    footer_link_list("Jonathan Palma", "https://github.com/JonathanPalma-code")
    footer_link_list("Kealan Heena", "https://github.com/kealanheena")
    footer_link_list("Sam Folorunsho", "https://github.com/samfolo")
  end

  def footer_link_list(title, link)
    concat content_tag(:div, class: ["two", "wide", "column"]) {
      concat(content_tag(:h4, title, class: ["ui", "inverted", "header"]))
      concat content_tag(:div, class: ["ui", "inverted", "link", "list"]) {
        link_to "GitHub", link, class: "item"
      }
    }
  end

  def footer_end
    concat content_tag(:div, nil, class: ["ui", "inverted", "section", "divider"])
    concat(image_tag "acebook_logo.png", class: "ui centered mini image")
    concat content_tag(:div, class: [
     "ui", "horizontal", "inverted",
     "small", "divided", "link", "list"
    ]) {
      link_to "Terms and Conditions", "#", class: "item"
      link_to "Privacy Policy", "#", class: "item"
    }
  end
end
