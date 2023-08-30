# Releasing

Manual releases are not generally necessary. When one of the Pact gems is released, it sends a repository dispatch notification with event type `gem-released`, which triggers the `Update gems` Github Action that updates the gems and commits the changes. The `Release` workflow is then triggered by another repository dispatch action of type `release-triggered` which generates the release notes, builds and publishes the Docker image, and creates the git commits and tags.

If the packaging code needs to be updated, a manual release can be performed by running the `Release Docker image with updated packaging` workflow from the UI.
