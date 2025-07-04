import './style.css'
import init, { 
  add, 
  multiply, 
  reverse_string, 
  count_words, 
  fibonacci, 
  prime_count, 
  set_text_content_safe,
  element_exists
} from '../pkg/rust_wasm.js'

// Initialize the WASM module
async function initWasm() {
  try {
    // Initialize the wasm module
    await init();
    console.log('🦀 Rust/WebAssembly module loaded successfully!');
    
    // Set up event listeners after WASM is loaded
    setupEventListeners();
  } catch (error) {
    console.error('Failed to load WASM module:', error);
  }
}

function setupEventListeners() {
  // Math operations
  const addBtn = document.getElementById('add-btn') as HTMLButtonElement;
  const multiplyBtn = document.getElementById('multiply-btn') as HTMLButtonElement;
  const mathResult = document.getElementById('math-result') as HTMLDivElement;

  addBtn.addEventListener('click', () => {
    const num1 = parseFloat((document.getElementById('num1') as HTMLInputElement).value);
    const num2 = parseFloat((document.getElementById('num2') as HTMLInputElement).value);
    
    if (!isNaN(num1) && !isNaN(num2)) {
      const result = add(Math.floor(num1), Math.floor(num2));
      mathResult.innerHTML = `<strong>Addition Result:</strong> ${num1} + ${num2} = ${result}`;
    } else {
      mathResult.innerHTML = '<strong>Error:</strong> Please enter valid numbers';
    }
  });

  multiplyBtn.addEventListener('click', () => {
    const num1 = parseFloat((document.getElementById('num1') as HTMLInputElement).value);
    const num2 = parseFloat((document.getElementById('num2') as HTMLInputElement).value);
    
    if (!isNaN(num1) && !isNaN(num2)) {
      const result = multiply(num1, num2);
      mathResult.innerHTML = `<strong>Multiplication Result:</strong> ${num1} × ${num2} = ${result}`;
    } else {
      mathResult.innerHTML = '<strong>Error:</strong> Please enter valid numbers';
    }
  });

  // String operations
  const reverseBtn = document.getElementById('reverse-btn') as HTMLButtonElement;
  const countWordsBtn = document.getElementById('count-words-btn') as HTMLButtonElement;
  const stringResult = document.getElementById('string-result') as HTMLDivElement;

  reverseBtn.addEventListener('click', () => {
    const text = (document.getElementById('text-input') as HTMLInputElement).value;
    const reversed = reverse_string(text);
    stringResult.innerHTML = `<strong>Reversed:</strong> "${text}" → "${reversed}"`;
  });

  countWordsBtn.addEventListener('click', () => {
    const text = (document.getElementById('text-input') as HTMLInputElement).value;
    const wordCount = count_words(text);
    stringResult.innerHTML = `<strong>Word Count:</strong> `;
    const textNode = document.createTextNode(`"${text}" contains ${wordCount} word(s)`);
    stringResult.appendChild(textNode);
  });

  // Performance operations
  const fibBtn = document.getElementById('fib-btn') as HTMLButtonElement;
  const primeBtn = document.getElementById('prime-btn') as HTMLButtonElement;
  const performanceResult = document.getElementById('performance-result') as HTMLDivElement;

  fibBtn.addEventListener('click', () => {
    const n = parseInt((document.getElementById('fib-input') as HTMLInputElement).value);
    
    if (!isNaN(n) && n >= 0) {
      const startTime = performance.now();
      const result = fibonacci(n);
      const endTime = performance.now();
      const duration = (endTime - startTime).toFixed(2);
      
      performanceResult.innerHTML = `
        <strong>Fibonacci Result:</strong> fibonacci(${n}) = ${result}<br>
        <span class="performance-info">Computed in ${duration}ms by Rust/WASM</span>
      `;
    } else {
      performanceResult.innerHTML = '<strong>Error:</strong> Please enter a valid non-negative number';
    }
  });

  primeBtn.addEventListener('click', () => {
    const limit = parseInt((document.getElementById('prime-input') as HTMLInputElement).value);
    
    if (!isNaN(limit) && limit >= 0) {
      const startTime = performance.now();
      const result = prime_count(limit);
      const endTime = performance.now();
      const duration = (endTime - startTime).toFixed(2);
      
      performanceResult.innerHTML = `
        <strong>Prime Count:</strong> Found ${result} prime(s) up to ${limit}<br>
        <span class="performance-info">Computed in ${duration}ms by Rust/WASM</span>
      `;
    } else {
      performanceResult.innerHTML = '<strong>Error:</strong> Please enter a valid non-negative number';
    }
  });

  // DOM manipulation
  const domBtn = document.getElementById('dom-btn') as HTMLButtonElement;
  domBtn.addEventListener('click', () => {
    const text = (document.getElementById('dom-text') as HTMLInputElement).value;
    
    // First check if the target element exists
    if (element_exists('rust-target')) {
      // Use the safer function that returns a boolean
      const success = set_text_content_safe('rust-target', text);
      if (!success) {
        console.error('Failed to update element content');
      }
    } else {
      console.error('Target element "rust-target" not found');
    }
  });
}

// Load WASM when the page loads
initWasm();
