FOLDER := ./scripts
SCRIPTS := $(FOLDER)/install-deps.sh $(FOLDER)/launch-argo.sh

all:
	@echo "$(BOLD)$(YELLOW)Executing file -> $(RESET)$(SCRIPTS)"
	@chmod +x $(SCRIPTS)
	@for script in $(SCRIPTS); do \
		echo "$(BOLD)$(YELLOW)Executing $$script$(RESET)"; \
		$$script; \
	done

clean:
	@sudo kubectl delete ns argocd
	@sudo kubectl delete ns dev
	@sudo docker system prune -fa

forward-app:
	@sudo kubectl port-forward svc/app-service -n dev 8888:8888

re : clean all

.PHONY: all clean re forward-app

# COLORS
BOLD = \033[1m
RESET = \033[0m
RED = \033[91m
GREEN = \033[92m
YELLOW = \033[93m
