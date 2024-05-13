<p align="center">
    <img src="https://raw.githubusercontent.com/Ascentrade/docs/main/assets/icon_plain.svg" alt="Ascentrade Logo"/>
</p>

# pgModeler Docker Image

This repository contains the [`Dockerfile`](./Dockerfile) to build the [pgModeler](https://pgmodeler.io/) image used to create the [database schema](https://github.com/Ascentrade/database) for Ascentrade.

## Usage

The image comes with a PostgreSQL database and the necessary environment variables set to directly start pgModeler without any configuration needed.

### Build

Run the [`build.sh`](./build.sh) script without any arguments to create the image initially.
Subsequent runs will update the base image.

You can also specify a different version of pgModeler with the `VERSION` build argument:
```bash
./build.sh --build-arg VERSION=1.0.6
```

### Run pgModeler

After building the image, you can start pgModeler by running the [`start.sh`](./start.sh) script.
If you do not pass any arguments, the `$HOME` directory will be mounted to `/mnt/` inside the container.

You can also specify a different directory by specifying a single positional argument containing the absolute path on the host:
```bash
./start.sh /path/to/dir/
```

## Contributing

We encourage public contributions! Please review [CONTRIBUTING.md](https://github.com/Ascentrade/docs/blob/main/CONTRIBUTING.md) for details.

## License

<p align="center">
    <img src="https://www.gnu.org/graphics/agplv3-with-text-162x68.png" alt="GNU Affero General Public License Version 3"/>
</p>

```
Copyright (C) 2024 Dennis Greguhn and Pascal Dengler

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

See [LICENSE](./LICENSE) for more information.