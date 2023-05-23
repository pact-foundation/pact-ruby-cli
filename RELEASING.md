# Releasing

When one of the Pact gems is released, it sends a repository dispatch notification with event type `gem-released`, which triggers the `Update gems` Github Action that updates the gems and commits the changes. The `Release` workflow is then triggered by another repository dispatch action of type `release-triggered` which generates the release notes, builds and publishes the Docker image, and creates the git commits and tags.

If the packaging code needs to be updated, a manual release can be performed by running the `Release Docker image with updated packaging` workflow from the UI.

# Releasing

Please read the [versioning](/#versioning) section of the README file before continuing.

The semantic version part of the tag is stored in the `VERSION` file at the root of the repository.

> Manual releases are not generally necessary.

## Automatic releases of the Docker image triggered by the release of one of the Pact gem

When one of the Pact gems is released by the Github Action in its repository, the `repository_dispatch` action of the `pact-ruby-cli` repository will be invoked with the type `gem-released`, and the release details (name, version, increment).

This causes the `update_gems.yml` workflow to be run. At the end of the workflow, it will trigger a release by invoking the `repository_dispatch` action with type `release-triggered`, passing in the increment.

Note: sometimes bundler cannot find the newly released gem straight away, and the job needs to be re-run via the UI.

### Manual releases of the Docker image triggered by the release of one of the Pact gem

* On the Github Actions page, select `Update gems`
* Select `Run workflow`
* To attempt to update a particular gem - update the default `released_gem_name` & set the required `released_gem_version`  and then click `Run workflow`. This should be the normal process if a Pact gem has been updated.
* To release a non-minor version change, select the `released_gem_version_increment` you want along with the above values, and click `Run workflow`.
* If the `Gemfile.lock` is updated, the results will be committed back to the repository, along with an updated `lib/pact/cli/version.rb` set to the `released_gem_version_increment` (which defaults to minor)
* This will trigger an automated release of the Docker image, where the Docker semver tag will be updated by a the same `released_gem_version_increment`


## Manually releasing the Docker image

* On the Github Actions page, select `Release Docker image`
* Select `Run workflow`
* To release a minor version change, do not set any inputs - just click `Run workflow`. This should be the normal process if you've done some changes to the Docker image.
* To release a non-minor version change, select the increment you want, and click `Run workflow`.
* To set a custom version number (not sure of the usecase for this, but just in case...), set both the version AND the increment and click `Run workflow`.
* To do a completely custom tag, just set the "Custom Docker image tag" and click `Run workflow`. If you do this, the VERSION file will NOT be updated. It is for testing purposes only.
