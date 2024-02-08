use macroquad::{
    prelude::*,
    ui::{hash, root_ui, widgets},
};

use crate::State;

pub fn spawn_game_ui(state: &mut State) {
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
