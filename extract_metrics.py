import os
import re
from tabulate import tabulate


def extract_metrics(file_path):
    metrics = {
        "file": file_path,
        "plan_cost": None,
        "nodes_generated": None,
        "nodes_expanded": None,
        "total_time": None,
    }

    with open(file_path, "r") as file:
        for line in file:
            if "Plan cost:" in line:
                match = re.search(r"Plan cost: (\d+)", line)
                if match:
                    metrics["plan_cost"] = int(match.group(1))
            elif "Generated" in line:
                match = re.search(r"Generated (\d+) state", line)
                if match:
                    metrics["nodes_generated"] = int(match.group(1))
            elif "Expanded" in line:
                match = re.search(r"Expanded (\d+) state", line)
                if match:
                    metrics["nodes_expanded"] = int(match.group(1))
            elif "Total time:" in line:
                match = re.search(r"Total time: ([\d.]+)s", line)
                if match:
                    metrics["total_time"] = float(match.group(1))

    return metrics


def process_directory(directory):
    results = []
    for root, _, files in os.walk(directory):
        for filename in files:
            if filename.startswith("stats-") and filename.endswith(".txt"):
                file_path = os.path.join(root, filename)
                metrics = extract_metrics(file_path)
                results.append(metrics)
    return results


def format_file_name(file_path):
    directory, filename = file_path.split("/")
    problem_number = re.search(r"stats-(\d+)", filename).group(1)

    directory_map = {
        "solution_default": "Solution Default",
        "solution_coordinates": "Solution Coordinates",
        "solution_adjacency": "Solution Adjacency",
    }
    left_part = directory_map.get(directory, directory)
    right_part = f"Problem-{problem_number}"

    return f"{left_part:<20} {right_part:>20}"


def main():
    directories = ["solution_default", "solution_coordinates", "solution_adjacency"]
    all_results = []

    for directory in directories:
        results = process_directory(directory)
        all_results.extend(results)

    all_results.sort(key=lambda x: int(re.search(r"stats-(\d+)", x["file"]).group(1)))

    table_data = [
        [
            format_file_name(result["file"]),
            result["plan_cost"],
            result["nodes_generated"],
            result["nodes_expanded"],
            result["total_time"],
        ]
        for result in all_results
    ]

    headers = [
        "File",
        "Plan Cost",
        "Nodes Generated",
        "Nodes Expanded",
        "Total Time",
    ]
    print(tabulate(table_data, headers=headers, tablefmt="grid"))


if __name__ == "__main__":
    main()
