package com.datamy.main.dao;

import com.datamy.main.bean.CompraCredito;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Date;

/**
 *
 * @author ric_l
 */
public class CompraCreditoDao extends ConexaoDao{
    
    /**
     * Insere uma compra no bancod
     */
    public void insert(CompraCredito compra){
        CriarConexao();
        
        try {
            
            preparacao = conexao.prepareStatement("INSERT INTO `compracredito`(`valorComprado`, `dataCompra`, `numeroParcelas`, `usuario_id`) VALUES (?,?,?,?)");
            preparacao.setInt(1, compra.getValorComprado());
            preparacao.setDate(2, (Date) compra.getDataCompra());
            preparacao.setInt(3, compra.getNumeroParcelas());
            preparacao.setInt(4,compra.getUser().getId());
            preparacao.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            fecharConexao();
        }
    }
}