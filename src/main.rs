use macroquad::{
    prelude::*,
    ui::{hash, root_ui, widgets},
};

enum State {
    Playing,
    Won,
    Lost,
}

#[macroquad::main("Letters Game")]
async fn main() {
    let mut game_state: State = State::Playing;

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

        spawn_game_ui(&mut game_state);

        ball_position.x += movement.x;
        ball_position.y += movement.y;
        draw_circle(ball_position.x, ball_position.y, 15.0, GREEN);

        next_frame().await
    }
}

fn spawn_game_ui(state: &mut State) {
    match *state {
        State::Playing => widgets::Window::new(hash!(), vec2(500.0, 50.0), vec2(300.0, 300.0)).ui(
            &mut *root_ui(),
            |ui| {
                ui.label(None, "C");

                ui.label(None, "A");

                if ui.button(None, "T") {
                    println!("Well Done!");
                    *state = State::Won;
                }

                if ui.button(None, "Z") {
                    println!("You got it WRONG! No one loves you and your life is a failure!");
                    *state = State::Lost;
                }
            },
        ),

        State::Won => widgets::Window::new(hash!(), vec2(500.0, 50.0), vec2(300.0, 300.0)).ui(
            &mut *root_ui(),
            |ui| {
                ui.label(None, "Well Done! You have won");

                if ui.button(None, "Play again") {
                    *state = State::Playing;
                }
            },
        ),
        State::Lost => widgets::Window::new(hash!(), vec2(500.0, 50.0), vec2(300.0, 300.0)).ui(
            &mut *root_ui(),
            |ui| {
                ui.label(None, "You have lost. Your entire life is a failure!");

                if ui.button(None, "Play again") {
                    *state = State::Playing;
                }
            },
        ),
    };
}

fn normalize(v: Vec2) -> Vec2 {
    let len = v.length();
    if len == 0.0 {
        Vec2::ZERO
    } else {
        v / len * 10.0
    }
}
