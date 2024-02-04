use macroquad::{
    prelude::*,
    ui::{hash, root_ui, widgets},
};

#[macroquad::main("Letters Game")]
async fn main() {
    let x = screen_width() / 2.0;
    let y = screen_width() / 2.0;

    let mut movement = Vec2::ZERO;
    let mut ball_position = Vec2 { x, y };

    loop {
        clear_background(LIGHTGRAY);

        movement = Vec2::ZERO;

        if is_key_down(KeyCode::D) {
            movement.x += 10.0;
        }
        if is_key_down(KeyCode::A) {
            movement.x -= 10.0;
        }
        if is_key_down(KeyCode::S) {
            movement.y += 10.0;
        }
        if is_key_down(KeyCode::W) {
            movement.y -= 10.0;
        }
        movement = normalize(movement);

        spawn_ui();

        ball_position.x += movement.x;
        ball_position.y += movement.y;
        draw_circle(ball_position.x, ball_position.y, 15.0, GREEN);

        next_frame().await
    }
}

fn spawn_ui() {
    widgets::Window::new(hash!(), vec2(470.0, 50.0), vec2(300.0, 300.0))
        .label("Test Window")
        .ui(&mut *root_ui(), |ui| {
            ui.label(None, "Some text");
            if ui.button(None, "Click Me!") {
                println!("Hello World");
            }

            ui.separator();

            ui.label(None, "More text");
            if ui.button(None, "Click Me!") {
                println!("Hello Word (again)!");
            }
        });
}

fn normalize(v: Vec2) -> Vec2 {
    let len = v.length();
    if len == 0.0 {
        Vec2::ZERO
    } else {
        v / len * 10.0
    }
}
