from pathlib import Path

from clld.web.assets import environment

import hindukush


environment.append_path(
    Path(hindukush.__file__).parent.joinpath('static').as_posix(),
    url='/hindukush:static/')
environment.load_path = list(reversed(environment.load_path))
