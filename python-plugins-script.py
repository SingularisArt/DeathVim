import re
import argparse


def remove_duplictes(x):
    return list(dict.fromkeys(x))


def parse_plugins_file(plugins_file, header_list, plugin_data):
    plugin_file = open(plugins_file, 'r')

    for line in plugin_file:
        try:
            try:
                line_regex = re.match(r'^    -- (.+)', line)
                header_name = line_regex.group(1)
                header_list.append(header_name)
            except Exception:
                pass

            try:
                line_regex = re.match('.+{ \'(.+)\' } -- (.+)', line)
                plugin_link = 'https://github.com/{}'.format(
                    line_regex.group(1))
                plugin_name = re.match(r'.+/(.+)', line_regex.group(1))
                note = line_regex.group(2)
                plugin_quick_data = [plugin_link, header_name,
                                     plugin_name.group(1),
                                     note]
                plugin_data.append(plugin_quick_data)
            except Exception:
                line_regex = re.match('.+{ \'(.+)\' }', line)
                plugin_link = 'https://github.com/{}'.format(
                    line_regex.group(1))
                plugin_name = re.match(r'.+/(.+)', line_regex.group(1))
                plugin_quick_data = [plugin_link, header_name,
                                     plugin_name.group(1)]
                plugin_data.append(plugin_quick_data)
        except Exception:
            pass

    return header_list, plugin_data


def parse_readme_file(readme_file, header_list, plugin_data):
    header_list = []
    new_headers = []
    random_file = open('plugins.md', 'w')
    printed = False

    for header in plugin_data:
        header_list.append(header[1])

    header_list = remove_duplictes(header_list)

    for header in header_list:
        for char in header:
            new_header = header.lower()

            new_header = new_header.replace(' ', '-')
        new_headers.append(new_header)

    random_file.write('# Table of Contents\n\n')
    random_file.write('* [Plugins](plugins)\n')

    for header, new_header in zip(header_list, new_headers):
        random_file.write('    * [{}]({})\n'.format(header, new_header))

    random_file.write('\n# Plugins\n\n')

    for x, header in enumerate(header_list):
        for data in plugin_data:
            if header == data[1]:
                try:
                    random_file.write('* [{}]({}): {}\n'.format(data[2],
                                                                data[0],
                                                                data[3]))

                except Exception:
                    random_file.write('* [{}]({})\n'.format(data[2], data[0]))
            elif header != data[1] and header_list[x-1] == data[1]:
                if not printed:
                    print(header)
                    printed = True
                    random_file.write('\n## ' + header + '\n\n')
                else:
                    printed = False


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('rf', help='The location to the README.md file.')
    parser.add_argument('pf', help='The location to the plugins.lua file.')

    args = parser.parse_args()

    header_list = []
    plugin_data = []

    header_list, plugin_data = parse_plugins_file(args.pf, header_list,
                                                  plugin_data)
    parse_readme_file(args.rf, header_list, plugin_data)


if __name__ == '__main__':
    main()
