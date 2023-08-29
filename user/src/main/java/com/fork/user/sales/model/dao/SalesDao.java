package com.fork.user.sales.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;

@Repository
public class SalesDao {
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Structure> selectStructureList() {
        return sqlSession.selectList("salesMapper.selectStructureList");
    }

    public int deleteStructure() {
        return sqlSession.delete("salesMapper.deleteStructure");
    }

    public int saveStructure(Structure struc) {
        return sqlSession.insert("salesMapper.saveStructure", struc);
    }

    public List<Receipt> selectOrderList() {
        return sqlSession.selectList("salesMapper.selectOrderList");
    }

    public List<Receipt> detailOrderList(int kioskNo) {
        return sqlSession.selectList("salesMapper.detailOrderList", kioskNo);
    }

    public int clearTable(int kioskNo) {
        return sqlSession.update("salesMapper.clearTable", kioskNo);
    }


}