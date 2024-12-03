# ModelMinion

A Kubernetes operator for simplifying ML model deployment and management.

## Overview

ModelMinion is a Kubernetes operator designed to streamline the deployment and management of machine learning models. It focuses on simplicity and extensibility, making it easier for teams to manage their ML model lifecycles in Kubernetes environments.

## Features

- Custom Resource Definition (CRD) for model deployments
- Basic model lifecycle management
- Health monitoring
- Status reporting
- Resource management

## Architecture

```mermaid
graph TB
    subgraph "Kubernetes Cluster"
        subgraph "ModelMinion Operator"
            Controller["Controller Manager"]
            Reconciler["Reconciliation Loop"]
            ResourceManager["Resource Manager"]
            HealthChecker["Health Checker"]
        end

        subgraph "Custom Resources"
            CRD["ModelDeployment CRD"]
            CR["ModelDeployment CR"]
        end

        subgraph "Kubernetes Resources"
            Deploy["Deployments"]
            Svc["Services"]
            CM["ConfigMaps"]
            Secrets["Secrets"]
        end

        subgraph "ML Model Pods"
            Flask["Flask API"]
            Model["ML Model"]
            Metrics["Metrics Endpoint"]
        end
    end

    User["User/Client"] --> CR
    CR --> Controller
    Controller --> Reconciler
    Reconciler --> ResourceManager
    ResourceManager --> Deploy
    ResourceManager --> Svc
    ResourceManager --> CM
    ResourceManager --> Secrets
    HealthChecker --> Model
    Deploy --> Flask
    Flask --> Model
    Model --> Metrics
    Svc --> Flask
```

