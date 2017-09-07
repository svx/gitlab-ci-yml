# A collection of `.gitlab-ci.yml` templates
[![build status](https://gitlab.com/gitlab-org/gitlab-ci-yml/badges/master/build.svg)](https://gitlab.com/gitlab-org/gitlab-ci-yml/commits/master) [![coverage report](https://gitlab.com/gitlab-org/gitlab-ci-yml/badges/master/coverage.svg)](https://gitlab.com/gitlab-org/gitlab-ci-yml/commits/master)

This is GitLabs collection of [`.gitlab-ci.yml`][ci-docs] file templates, to be used
in conjunction with [GitLab CI][gl-ci].
This list is used to populate the `.gitlab-ci.yml` template choosers available
on all GitLab instances running 8.9 or later.

For more information about how `.gitlab-ci.yml` files work, and how to use them,
please read the [documentation on GitLab CI][ci-docs]. Please keep in mind that
these templates might need editing to suit your setup, and should be considered
guideline.

[ci-docs]: http://docs.gitlab.com/ce/ci/
[gl-ci]: https://about.gitlab.com/gitlab-ci/


## Folder structure

The files in the root directory are for `.gitlab-ci.yml` templates that are
project specific, such as language or framework specific templates.
The Pages folder holds `gitlab-ci.yml` templates to be used with [GitLab Pages][gl-pages].

[gl-pages]: http://docs.gitlab.com/ee/pages/README.html

## Contributing guidelines

Please see the [contribution guidelines](CONTRIBUTING.md)
