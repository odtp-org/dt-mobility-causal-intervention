# dt-mobility-causal-intervention

This is a prototype of how to share a DT. 

```mermaid
graph LR
    ExternalDatabase[External Database] --> SQLDataloader[SQL Dataloader]
    ExternalDatabase --> PostGisDataloader[Post-GIS Dataloader]

    subgraph ODTP
        SQLDataloader --> ODTPMobilitySimulation[ODTP Mobility Simulation]
        PostGisDataloader --> ODTPMobilitySimulation
        ODTPMobilitySimulation --> ODTpMetrics[ODTP Mobility Metrics]
        ODTpMetrics -> pyGWalker[pyGWalker CSV Visualization]
        ODTPMobilitySimulation --> ODTpNextLocationPrediction[ODTP Next Location Prediction]
    end

    Model[Model] --> ODTpNextLocationPrediction
```

In order to adapt this to the current ODTP pipeline, the workflow is executed in this order:

1. SQL-Dataloader
2. Post-GIS Dataloader
3. Mobility Simulation 
4. Mobility Metrics
5. Next Location Prediction
6. pyGWalker

## Tutorial

1. Clone this repository
2. Edit dt-example.sh with the ODTP user email
3. Configure the parameters. 
4. Rename `001.secrets.dist` and `002.secrets.dist` to `001.secrets` and `002.secrets`. Add your credentials. 
5. Run the bash script: sh dt-mobility-causal-intervention.sh


How to remove the execution? This command will delete any mongoDB entry and the content of the execution folder, allowing for a fresh execution.

```bash
odtp execution delete --execution-name execution --project-path $(pwd)/dt-mobility-causal-intervention/execution
```
