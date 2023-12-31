<p align="center">
  <a href="https://github.com/miniwater/mkdocs/">
    <img src="https://raw.githubusercontent.com/miniwater/mkdocs/master/docs/assets/logo.png" width="320" alt="Material for MkDocs">
  </a>
</p>

<p align="center">
  <strong>
    A powerful documentation framework on top of
    <a href="https://www.mkdocs.org/">MkDocs</a>
  </strong>
</p>

<p align="center">
    <a href="https://hub.docker.com/r/miniwater/mkdocs"><img alt="Docker Stars" src="https://img.shields.io/docker/stars/miniwater/mkdocs"></a>
    <img alt="GitHub License" src="https://img.shields.io/github/license/miniwater/mkdocs">
    <a href="https://github.com/miniwater/mkdocs/releases"><img src="https://img.shields.io/github/v/release/miniwater/mkdocs" alt="GitHub release"></a>
    <a href="https://github.com/miniwater/mkdocs"><img src="https://img.shields.io/github/stars/miniwater/mkdocs?color=%231890FF&style=flat-square" alt="Stars"></a>
    <a href="https://app.fossa.com/projects/git%2Bgithub.com%2Fminiwater%2Fmkdocs?ref=badge_shield&issueType=license" alt="FOSSA Status"><img src="https://app.fossa.com/api/projects/git%2Bgithub.com%2Fminiwater%2Fmkdocs.svg?type=shield&issueType=license"/></a>
</p>

<p align="center">
  Write your documentation in Markdown and create a professional static site for
  your Open Source or commercial project in minutes – searchable, customizable,
  more than 60 languages, for all devices.
</p>

# MKdocs

note

## Deploy

### Deploy With Vercel(Recommended)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/miniwater/mkdocs)

Just click the button above and follow the instructions to deploy your own copy of the app.

### Deploy With Docker

- <https://hub.docker.com/r/miniwater/mkdocs>
- <https://github.com/miniwater/mkdocs/pkgs/container/mkdocs>

To deploy with Docker, you can use the following command:

```shell
docker run -d --name mkdocs -p 80:8000 miniwater/mkdocs:latest
```

or

```shell
docker run -d --name mkdocs \
--restart always \
-p 80:8000 \
miniwater/mkdocs:latest
```

This will start the geminiprochat service, accessible at <http://localhost:80>.

## Contributing

Contributions of all types are more than welcome; if you are interested in contributing code, feel free to check out our GitHub [Issues][github-issues-link] and [Projects][github-project-link] to get stuck in to show us what you’re made of.

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=miniwater/mkdocs&type=Date)](https://star-history.com/#miniwater/mkdocs&Date)

## FOSSA Status

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fminiwater%2Fmkdocs.svg?type=large&issueType=license)](https://app.fossa.com/projects/git%2Bgithub.com%2Fminiwater%2Fmkdocs?ref=badge_large&issueType=license)

## License

MIT License

Copyright (c) 2014-2023 [手里有只毛毛虫](https://krjojo.com/), All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
