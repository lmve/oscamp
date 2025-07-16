#![cfg_attr(feature = "axstd", no_std)]
#![cfg_attr(feature = "axstd", no_main)]

#[cfg(feature = "axstd")]
use axstd::println;
use axstd::print_color;

#[cfg_attr(feature = "axstd", no_mangle)]
fn main() {
    // print_color!("\x1b[34m", "\x1b[0m", "[WithColor]: Hello, Arceos!");
    print_color!("#0000FF", "#c545ccff", "[WithColor]: Hello, Arceos!");
    print_color!("#7dac5bff", "#206c8dff", "[WithColor]: Hello, Arceos!");
    print_color!("#e46697ff", "#901616ff", "[WithColor]: Hello, Arceos!");
    print_color!("#7f5620ff", "#4c9c1bff", "[WithColor]: Hello, Arceos!");
}
