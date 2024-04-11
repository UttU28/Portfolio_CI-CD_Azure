# Hello Workld


# On New Push
-   Environments
-   GitHub Secrets
-   Clone Git Repo using **RUN**
-   Azure CLI
-   Artifacts *(Storing TF File temporarily)*
    ```
    on:
      push:
        branches:
        -  main
      pull_request:
    ```

# Triggers
-   GitHub API
    ```
    on:
      repository_dispatch:
        types: [triggerAPI]
    ```