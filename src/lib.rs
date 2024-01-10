use stylance::import_style;
use wasm_bindgen::prelude::wasm_bindgen;

#[wasm_bindgen]
pub fn main() {
    import_style!(style, "main.module.css");

    leptos::mount_to_body(|| {
        leptos::view! {
            <div class=style::container>
                <h1 class=style::header>"Leptos vite starter!!"</h1>
                <p class=style::paragraph>"This is an example of how to write"</p>
            </div>
        }
    });
}
