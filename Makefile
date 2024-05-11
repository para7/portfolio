DOCKER_VRT_RUN := docker compose run --rm --service-ports playwright_vrt /bin/sh -c

.DEFAULT_GOAL := help

# << main commands >>

dev: util/build svelte-portfolio/node_modules ## run remix server ##
	docker compose run --rm -p 5173:5173 front_dev /bin/sh -c "pnpm run dev"

bash: util/build ## run bash (for package install etc.) ##
	docker compose run --rm -it front_dev bash

# ladle: util/build svelte-portfolio/node_modules ## run ladle (storybook server)
# 	docker compose run --rm -p 127.0.0.1:61000:61000  front_dev bash -c "pnpm run ladle dev"

check: util/build svelte-portfolio/node_modules
	docker compose run --rm front_dev bash -c "pnpm run check:watch"

lint: util/build svelte-portfolio/node_modules format ## lint & format
	docker compose run --rm front_dev bash -c "pnpm run lint"
	docker compose run --rm front_dev bash -c "pnpm run check"

format: util/build svelte-portfolio/node_modules ## format
	docker compose run --rm front_dev bash -c "pnpm run format"

test: util/build svelte-portfolio/node_modules ## run vitest ui
	docker compose run --rm -p 127.0.0.1:51204:51204 front_dev /bin/sh -c "pnpm run test:unit"

build: util/build svelte-portfolio/node_modules ## run build
	docker compose run --rm front_dev /bin/sh -c "pnpm run build"

preview: util/build ## preview production server
	docker compose run --rm -p 127.0.0.1:4173:4173 front_dev /bin/sh -c "pnpm run preview"


vrt: util/build svelte-portfolio/node_modules ## run visual regression test
	${DOCKER_VRT_RUN} "pnpm run test:integration"

# vrt: util/build svelte-portfolio/node_modules ## run visual regression test
# 	${DOCKER_VRT_RUN} "pnpm run vrt"

# vrt/update: util/build svelte-portfolio/node_modules ## update visual regression snapshots
# 	${DOCKER_VRT_RUN} "pnpm run vrt:update"

# << ci commands >>

util/ci-checks: ci/lint ci/test ci/build ci/vrt ## run all ci checks

ci/lint: util/build svelte-portfolio/node_modules
	docker compose run --rm -p 127.0.0.1:51204:51204 front_dev /bin/sh -c "pnpm run lint:ci"

ci/test: util/build svelte-portfolio/node_modules
	docker compose run --rm -p 127.0.0.1:51204:51204 front_dev /bin/sh -c "pnpm run test:ci"

ci/vrt: vrt

ci/build: build

# << utility commands >>


# TODO: Docker権限まわりの仮対応
util/permission: ## fix file permission (TODO #354)
	sudo chmod 777 -R .


# https://ktrysmt.github.io/blog/write-useful-help-command-by-shell/
help: ## print this message ## make
	@echo "Example operations by makefile."
	@echo ""
	@echo "Usage: make SUB_COMMAND argument_name=argument_value"
	@echo ""
	@echo "Command list:"
	@echo ""
	@printf "\033[36m%-30s\033[0m %-50s %s\n" "[Sub command]" "[Description]" "[Example]"
	@grep -E '^[/a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | perl -pe 's%^([/a-zA-Z_-]+):.*?(##)%$$1 $$2%' | awk -F " *?## *?" '{printf "\033[36m%-30s\033[0m %-50s %s\n", $$1, $$2, $$3}'

# docker/stop:
# 	docker compose down --remove-orphans

# << internal commands >>

util/build:
	docker compose build front_dev playwright_vrt

svelte-portfolio/node_modules: remix/package.json remix/pnpm-lock.yaml
	docker compose run --rm front_dev pnpm install --frozen-lockfile


