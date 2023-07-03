import yaml
import os


with open("helm-java-app/Chart.yaml", "r") as stream:
    try:
        data = yaml.safe_load(stream)
        print(data["version"])
        os.putenv("HELM_CHART_VERSION",data["version"] )
        # os.system(f'export HELM_CHART_VERSION="{data["version"]}"')

    except yaml.YAMLError as exc:
        print(exc)