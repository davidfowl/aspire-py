#pragma warning disable ASPIREHOSTINGPYTHON001 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.

#:package Aspire.Hosting.Python@13.0.0-preview.1.25515.12
#:package Aspire.Hosting.Azure.AppContainers@13.0.0-preview.1.25515.12
#:package Aspire.Hosting.Azure.AppService@13.0.0-preview.1.25515.12
#:sdk Aspire.AppHost.Sdk@13.0.0-preview.1.25515.12

var builder = DistributedApplication.CreateBuilder(args);

builder.AddAzureAppServiceEnvironment("env");

builder.AddPythonExecutable("api", "./hello", "uvicorn")
       .WithArgs("main:app", "--host", "0.0.0.0", "--port", "8000")
       .WithHttpEndpoint(targetPort: 8000)
       .WithUvEnvironment()
       .WithHttpHealthCheck("/")
       .WithExternalHttpEndpoints();

builder.Build().Run();
