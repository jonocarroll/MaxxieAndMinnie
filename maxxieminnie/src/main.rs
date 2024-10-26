use itertools::Itertools;

fn swap(v: Vec<u32>, t1: usize, t2: usize) -> Vec<u32> {
    let mut vv = v;
    let tmp1 = vv[t1];
    let tmp2 = vv[t2];
    vv[t1] = tmp2;
    vv[t2] = tmp1;
    return vv;
}

fn maxmin(num: u32) -> (u32, u32) {
    let numc = num.to_string();
    let n = numc.len();
    let numv: Vec<u32> = numc
        .to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .collect();
    let mut opts = Vec::new();
    for (a, b) in (0..n).tuple_combinations() {
        opts.push((a, b));
    }
    let mut new: Vec<Vec<u32>> = Vec::new();
    new.push(numv.clone());
    for o in opts {
        new.push(swap(numv.clone(), o.0, o.1));
    }
    let keeps: Vec<Vec<u32>> = new.into_iter().filter(|x| x[0] != 0).collect();
    let mut vals = Vec::new();
    for v in keeps {
        let tmp: u32 = v
            .clone()
            .into_iter()
            .map(|x| x.to_string())
            .collect::<String>()
            .parse()
            .unwrap();
        vals.push(tmp);
    }
    let min = *vals.iter().min().unwrap();
    let max = *vals.iter().max().unwrap();
    (max, min)
}

fn main() {
    println!("{:?}", maxmin(213));
    println!("{:?}", maxmin(100));
    println!("{:?}", maxmin(12345));
    println!("{:?}", maxmin(11321))
}
