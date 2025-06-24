use wasm_bindgen::prelude::*;
use web_sys::console;

// Import the `console.log` function from the browser
#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = console)]
    fn log(s: &str);
}

// Define a macro to make console.log easier to use
macro_rules! console_log {
    ($($t:tt)*) => (log(&format_args!($($t)*).to_string()))
}

// Basic math functions for learning
#[wasm_bindgen]
pub fn add(a: i32, b: i32) -> i32 {
    console_log!("Computing {} + {} in Rust/WASM", a, b);
    a + b
}

#[wasm_bindgen]
pub fn multiply(a: f64, b: f64) -> f64 {
    console_log!("Computing {} * {} in Rust/WASM", a, b);
    a * b
}

// String processing
#[wasm_bindgen]
pub fn reverse_string(input: &str) -> String {
    console_log!("Reversing string: '{}'", input);
    input.chars().rev().collect()
}

#[wasm_bindgen]
pub fn count_words(text: &str) -> usize {
    console_log!("Counting words in: '{}'", text);
    text.split_whitespace().count()
}

// More complex computation - Fibonacci sequence
#[wasm_bindgen]
pub fn fibonacci(n: u32) -> u32 {
    console_log!("Computing fibonacci({}) in Rust/WASM", n);
    match n {
        0 => 0,
        1 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}

// Performance-heavy computation example
#[wasm_bindgen]
pub fn prime_count(limit: u32) -> u32 {
    console_log!("Counting primes up to {} in Rust/WASM", limit);

    if limit < 2 {
        return 0;
    }

    let mut count = 0;
    for num in 2..=limit {
        if is_prime(num) {
            count += 1;
        }
    }
    count
}

fn is_prime(n: u32) -> bool {
    if n < 2 {
        return false;
    }
    if n == 2 {
        return true;
    }
    if n % 2 == 0 {
        return false;
    }

    let sqrt_n = (n as f64).sqrt() as u32;
    for i in (3..=sqrt_n).step_by(2) {
        if n % i == 0 {
            return false;
        }
    }
    true
}

/// Sets the text content of a DOM element with the given ID.
/// 
/// This is a stub implementation for CI compatibility.
/// In the browser, this would manipulate DOM elements.
#[wasm_bindgen]
pub fn set_text_content(id: &str, text: &str) -> Result<(), JsValue> {
    console_log!("set_text_content called with id='{}', text='{}'", id, text);
    
    // Check if we're in a proper browser environment
    if let Some(window) = web_sys::window() {
        if let Some(document) = window.document() {
            if let Some(element) = document.get_element_by_id(id) {
                element.set_text_content(Some(text));
                return Ok(());
            }
        }
    }
    
    // If we reach here, we're not in a browser or element doesn't exist
    Err(JsValue::from_str("Not in browser environment or element not found"))
}

/// Safer version of set_text_content that returns a boolean
#[wasm_bindgen]
pub fn set_text_content_safe(id: &str, text: &str) -> bool {
    match set_text_content(id, text) {
        Ok(()) => {
            console_log!("✅ Successfully set text content for element '{}'", id);
            true
        }
        Err(_) => {
            console_log!("❌ Failed to set text content for element '{}'", id);
            false
        }
    }
}

/// Checks if a DOM element with the given ID exists
#[wasm_bindgen]
pub fn element_exists(id: &str) -> bool {
    if let Some(window) = web_sys::window() {
        if let Some(document) = window.document() {
            return document.get_element_by_id(id).is_some();
        }
    }
    false
}

// WASM module initialization (commented out to prevent build-time execution)
// #[wasm_bindgen(start)]
// pub fn main() {
//     // Only run if we're in a browser environment
//     if web_sys::window().is_some() {
//         console_log!("Rust/WebAssembly module loaded! 🦀✨");
//     }
// }
