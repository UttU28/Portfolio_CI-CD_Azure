# Hello Workld


# On New Push
-   Environments
-   GitHub Secrets
-   Clone Git Repo using **RUN**
-   Azure CLI
-   Artifacts *(Storing TF File temporarily)*
-   Linux Commands
    ```
    on:
      push:
        branches:
        -  main
      pull_request:
    ```

# Triggers
-   GitHub API
-   Storing BLOB
    ```
    on:
      repository_dispatch:
        types: [triggerAPI]
    ```