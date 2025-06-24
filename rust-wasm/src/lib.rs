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

// DOM manipulation example
#[wasm_bindgen]
pub fn set_text_content(id: &str, text: &str) -> Result<(), JsValue> {
    let window = web_sys::window().unwrap();
    let document = window.document().unwrap();
    let element = document.get_element_by_id(id).unwrap();
    
    console_log!("Setting text content of element '{}' to '{}'", id, text);
    element.set_text_content(Some(text));
    Ok(())
}

// Called when the wasm module is instantiated
#[wasm_bindgen(start)]
pub fn main() {
    console_log!("Rust/WebAssembly module loaded! 🦀✨");
}
