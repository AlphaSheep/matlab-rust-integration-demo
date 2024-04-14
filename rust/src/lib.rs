mod wrapper;


#[derive(Debug)]
pub struct Point {
    x: f64,
    y: f64,
}

impl Point {
    pub fn distance_to(&self, p2: &Point) -> f64 {
        let dx = (p2.x - self.x).abs();
        let dy = (p2.y - self.y).abs();
        (dx * dx + dy * dy).sqrt()
    }
}

pub fn add(left: usize, right: usize) -> usize {
    left + right
}


pub fn do_something_to_string(input: &str) -> String {
    format!("You gave me: {}", input)
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 5);
    }
}
