from os.path import join


if __name__ == "__main__":
    data_path = join("data", "e2e")
    for split in ["train", "test", "valid"]:
        input_path = join(data_path, f"{split}_initial.txt")
        output_path = join("data", f"e2e-{split}.txt")
        with open(input_path, "r") as f, open(output_path, "w") as g:
            for line in f:
                g.write(line.split("||")[-1])
