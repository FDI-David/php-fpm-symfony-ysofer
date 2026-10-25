# php-fpm-symfony-ysofer

Image PHP 7.4 FPM pour les projets Symfony, dérivée de
`registry.gitlab.com/damienduboeuf/docker/php-fpm-symfony:7.4-fpm`, avec des réglages PHP en plus (`php.ini`).

Construite par GitHub Actions à chaque push sur `main`, et publiée sur GitHub Container Registry.

## Utilisation

```yaml
services:
  api:
    image: ghcr.io/fdi-david/php-fpm-symfony-ysofer:7.4-fpm
```

Chaque construction publie aussi un tag figé `7.4-fpm-<sha du commit>`, pour revenir à une version précise.

## Construire à la main

Onglet **Actions** > **Build image** > **Run workflow**.

## Modifier

Ce dépôt est public : n'y mettez jamais de mot de passe, clé ou autre secret.

- Réglages PHP : `php.ini`
- Extensions ou paquets système : `Dockerfile`
