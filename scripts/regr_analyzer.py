#!/usr/bin/env python3

import sys
import re
import codecs


def main():
    # Check for correct command-line usage
    if len(sys.argv) != 2:
        print("Usage: python3 script.py REGRESS_FILE")
        exit()

    # Regular expression to match the beginning of a log entry
    regex_match_case_begin = re.compile(
            r'(^[^:]+) :.* :.* :.* :.* :.* :.* :.* :.* :.* :.* :.* :.* :.*:')

    # List of regex patterns to match against log content
    regex_str_list = [
        r'ufedr_partcomp.cpp, line 3178',
        r'ufedr_partcomp.cpp, line 2893',
        r'ufedr_partcomp.cpp, line 3094',
        r'ufedr_doeb.cpp, line 4437',
        r'-- Loading',
        r'Segmentation fault',
        r'VERIFIER-FAIL',
        r'ANA-KDB-NODU',
        r'successfully generated',
    ]

    # Compile regex patterns into a list of dictionaries for easier access
    regex_list = [{"regex": re.compile(regex_str), "matched_idx_set": set(
    ), "pattern_description": regex_str} for regex_str in regex_str_list]

    # Lists to store information about each log entry
    case_begin_line_list = []
    case_name_list = []

    # Read the log file
    print("="*80)
    print("Init...")
    print(f"Reading file \"{sys.argv[1]}\"...")
    with codecs.open(sys.argv[1], 'r', encoding='utf-8', errors='ignore') as process_file:
        file_as_list = process_file.read().splitlines()

    file_len = len(file_as_list)

    # Analyze the log file to find the start of each log entry
    print("Analyzing file...")
    line_number = 0
    number_of_case = 0
    total_matched_case = 0

    while line_number < file_len:
        match_case_begin = regex_match_case_begin.search(
            file_as_list[line_number])
        if match_case_begin:
            case_begin_line_list.append(line_number)
            case_name_list.append(match_case_begin.group(1))
            number_of_case += 1

        # Print progress every 100,000 lines
        if line_number % 100000 == 0 and line_number != 0:
            print(f"Processing line {line_number}, already found {number_of_case} cases")
        line_number += 1

    print(f"Found {number_of_case} cases")
    print("Matching regex pattern...")
    print("="*80)

    # Check each log entry for matches with each regex pattern
    for case_idx in range(len(case_begin_line_list)):
        begin_line = case_begin_line_list[case_idx]
        end_line = len(file_as_list) if case_idx + \
            1 == number_of_case else case_begin_line_list[case_idx + 1] - 1

        for check_line in range(begin_line, end_line):
            for regex_meta in regex_list:
                if regex_meta["regex"].search(file_as_list[check_line]):
                    regex_meta["matched_idx_set"].add(case_idx)

    # Display results for each regex pattern
    for regex_meta in regex_list:
        total_matched_case += len(regex_meta["matched_idx_set"])
        print(f"\n-> {regex_meta['pattern_description']} (cnt: {len(regex_meta['matched_idx_set'])})")
        matched_case_list = sorted(
            case_name_list[idx] for idx in regex_meta["matched_idx_set"])
        for matched_case in matched_case_list:
            print(f"       {matched_case}")

    print(f"\nTotal found cases: {total_matched_case}")


if __name__ == "__main__":
    main()
