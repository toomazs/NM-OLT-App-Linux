package models;

import javafx.beans.property.SimpleStringProperty;

public class Ticket {
    private final SimpleStringProperty criadoPor, cargo, descricao, previsao, dataHora, status;

    public Ticket(String criadoPor, String cargo, String descricao, String previsao, String dataHora, String status) {
        this.criadoPor = new SimpleStringProperty(criadoPor);
        this.cargo = new SimpleStringProperty(cargo);
        this.descricao = new SimpleStringProperty(descricao);
        this.previsao = new SimpleStringProperty(previsao);
        this.dataHora = new SimpleStringProperty(dataHora);
        this.status = new SimpleStringProperty(status);
    }

    public String getCriadoPor() { return criadoPor.get(); }
    public String getCargo() { return cargo.get(); }
    public String getDescricao() { return descricao.get(); }
    public String getPrevisao() { return previsao.get(); }
    public String getDataHora() { return dataHora.get(); }
    public String getStatus() { return status.get(); }
}
