layui.use(['tree', 'util'], function(){
  var tree = layui.tree
  ,layer = layui.layer
  ,util = layui.util
  //模拟数据1
  ,data = [
  {
	    title: 'Bulk',id: "1_bulk",spread:"true"
	        ,children: [{
	          title: 'ACC(Adrenocortical Cancer)',id: "1_ACC",spread:"true"
	          ,children: [
{title:'TCGA',id:'TCGA_ACC',spread:"true",children: [
{title:'mRNAsi',id:'TCGA-ACC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-ACC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_ACC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-ACC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-ACC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-ACC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-ACC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-ACC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-ACC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-ACC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-ACC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-ACC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-ACC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-ACC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-ACC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-ACC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-ACC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-ACC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-ACC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-ACC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-ACC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-ACC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-ACC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'BLCA(Bladder Cancer)',id: "1_BLCA"
	          ,children: [
{title:'TCGA',id:'TCGA_BLCA',children: [
{title:'mRNAsi',id:'TCGA-BLCA_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-BLCA_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_BLCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-BLCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-BLCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-BLCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-BLCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-BLCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-BLCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-BLCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-BLCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-BLCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-BLCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-BLCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-BLCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-BLCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-BLCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-BLCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-BLCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-BLCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-BLCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-BLCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-BLCA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'BOCA(Bone Cancer)',id: "1_BOCA"
	          ,children: [
{title:'ICGC',id:'ICGC_BOCA',children: [
{title:'mRNAsi',id:'ICGC-BOCA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-BOCA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_BOCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-BOCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-BOCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-BOCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-BOCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-BOCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-BOCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-BOCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-BOCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-BOCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-BOCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-BOCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-BOCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-BOCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-BOCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-BOCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-BOCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-BOCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-BOCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-BOCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-BOCA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'BPLL(B-cell lymphoblastic leukemia)',id: "1_BPLL"
	          ,children: [
{title:'ICGC',id:'ICGC_BPLL',children: [
{title:'mRNAsi',id:'ICGC-BPLL_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-BPLL_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_BPLL_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-BPLL_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-BPLL_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-BPLL_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-BPLL_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-BPLL_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-BPLL_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-BPLL_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-BPLL_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-BPLL_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-BPLL_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-BPLL_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-BPLL_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-BPLL_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-BPLL_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-BPLL_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-BPLL_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-BPLL_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-BPLL_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-BPLL_gsva_last'},
{title:'VeneziaHSC_cPsig_m2h',id:'VeneziaHSC_cPsig_m2h_of_ICGC-BPLL_gsva_last'},
{title:'VeneziaHSC_ES_m2h',id:'VeneziaHSC_ES_m2h_of_ICGC-BPLL_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-BPLL_gsva_last'}
]
}]}
			  ]
	        },
			{
	          title: 'BRCA(Breast Cancer)',id: "1_BRCA"
	          ,children: [
{title:'TCGA',id:'TCGA_BRCA',children: [
{title:'mRNAsi',id:'TCGA-BRCA_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-BRCA_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_BRCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-BRCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-BRCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-BRCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-BRCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-BRCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-BRCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-BRCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-BRCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-BRCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-BRCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-BRCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-BRCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-BRCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-BRCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-BRCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-BRCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-BRCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-BRCA_gsva_last'},
{title:'Mizuno_iPSC118',id:'Mizuno_iPSC118_of_TCGA-BRCA_gsva_last'},
{title:'Mizuno_iPSC340',id:'Mizuno_iPSC340_of_TCGA-BRCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-BRCA_gsva_last'},
{title:'Shats_et_al_CSR',id:'Shats_et_al_CSR_of_TCGA-BRCA_gsva_last'},
{title:'Shats_et_al_iPS',id:'Shats_et_al_iPS_of_TCGA-BRCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-BRCA_gsva_last'}
]
}]},
{title:'ICGC',id:'ICGC_BRCA',children: [
{title:'mRNAsi',id:'ICGC-BRCA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-BRCA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_BRCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-BRCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-BRCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-BRCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-BRCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-BRCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-BRCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-BRCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-BRCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-BRCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-BRCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-BRCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-BRCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-BRCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-BRCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-BRCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-BRCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-BRCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-BRCA_gsva_last'},
{title:'Mizuno_iPSC118',id:'Mizuno_iPSC118_of_ICGC-BRCA_gsva_last'},
{title:'Mizuno_iPSC340',id:'Mizuno_iPSC340_of_ICGC-BRCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-BRCA_gsva_last'},
{title:'Shats_et_al_CSR',id:'Shats_et_al_CSR_of_ICGC-BRCA_gsva_last'},
{title:'Shats_et_al_iPS',id:'Shats_et_al_iPS_of_ICGC-BRCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-BRCA_gsva_last'}
]
}]}
			  ]
	        },
			{
	          title: 'CESC(Cervical Cancer)',id: "1_CESC"
	          ,children: [
{title:'TCGA',id:'TCGA_CESC',children: [
{title:'mRNAsi',id:'TCGA-CESC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-CESC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_CESC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-CESC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-CESC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-CESC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-CESC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-CESC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-CESC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-CESC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-CESC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-CESC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-CESC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-CESC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-CESC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-CESC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-CESC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-CESC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-CESC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-CESC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-CESC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-CESC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-CESC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'CHOL(Bile Duct Cancer)',id: "1_CHOL"
	          ,children: [
{title:'TCGA',id:'TCGA_CHOL',children: [
{title:'mRNAsi',id:'TCGA-CHOL_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-CHOL_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_CHOL_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-CHOL_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-CHOL_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-CHOL_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-CHOL_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-CHOL_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-CHOL_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-CHOL_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-CHOL_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-CHOL_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-CHOL_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-CHOL_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-CHOL_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-CHOL_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-CHOL_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-CHOL_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-CHOL_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-CHOL_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-CHOL_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-CHOL_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-CHOL_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'CLLE(Chronic Lymphocytic Leukemia)',id: "1_CLLE"
	          ,children: [
{title:'ICGC',id:'ICGC_CLLE',children: [
{title:'mRNAsi',id:'ICGC-CLLE_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-CLLE_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_CLLE_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-CLLE_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-CLLE_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-CLLE_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-CLLE_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-CLLE_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-CLLE_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-CLLE_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-CLLE_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-CLLE_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-CLLE_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-CLLE_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-CLLE_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-CLLE_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-CLLE_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-CLLE_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-CLLE_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-CLLE_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-CLLE_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-CLLE_gsva_last'},
{title:'VeneziaHSC_cPsig_m2h',id:'VeneziaHSC_cPsig_m2h_of_ICGC-CLLE_gsva_last'},
{title:'VeneziaHSC_ES_m2h',id:'VeneziaHSC_ES_m2h_of_ICGC-CLLE_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-CLLE_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'COAD(Colon Cancer)',id: "1_COAD"
	          ,children: [
{title:'TCGA',id:'TCGA_COAD',children: [
{title:'mRNAsi',id:'TCGA-COAD_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-COAD_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_COAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-COAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-COAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-COAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-COAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-COAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-COAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-COAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-COAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-COAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-COAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-COAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-COAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-COAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-COAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-COAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-COAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-COAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-COAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-COAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-COAD_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'DLBC(Large B-cell Lymphoma)',id: "1_DLBC"
	          ,children: [
{title:'TCGA',id:'TCGA_DLBC',children: [
{title:'mRNAsi',id:'TCGA-DLBC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-DLBC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_DLBC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-DLBC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-DLBC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-DLBC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-DLBC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-DLBC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-DLBC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-DLBC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-DLBC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-DLBC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-DLBC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-DLBC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-DLBC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-DLBC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-DLBC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-DLBC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-DLBC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-DLBC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-DLBC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-DLBC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-DLBC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'ESCA(Esophageal Cancer)',id: "1_ESCA"
	          ,children: [
{title:'TCGA',id:'TCGA_ESCA',children: [
{title:'mRNAsi',id:'TCGA-ESCA_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-ESCA_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_ESCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-ESCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-ESCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-ESCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-ESCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-ESCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-ESCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-ESCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-ESCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-ESCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-ESCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-ESCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-ESCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-ESCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-ESCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-ESCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-ESCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-ESCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-ESCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-ESCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-ESCA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'GBM(Glioblastoma)',id: "1_GBM"
	          ,children: [
{title:'TCGA',id:'TCGA_GBM',children: [
{title:'mRNAsi',id:'TCGA-GBM_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-GBM_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_GBM_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-GBM_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-GBM_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-GBM_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-GBM_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-GBM_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-GBM_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-GBM_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-GBM_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-GBM_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-GBM_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-GBM_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-GBM_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-GBM_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-GBM_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-GBM_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-GBM_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-GBM_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-GBM_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-GBM_gsva_last'},
{title:'Yan_CD133_GBM_up',id:'Yan_CD133_GBM_up_of_TCGA-GBM_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-GBM_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'HNSC(Head and Neck Cancer)',id: "1_HNSC"
	          ,children: [
{title:'TCGA',id:'TCGA_HNSC',children: [
{title:'mRNAsi',id:'TCGA-HNSC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-HNSC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_HNSC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-HNSC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-HNSC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-HNSC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-HNSC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-HNSC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-HNSC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-HNSC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-HNSC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-HNSC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-HNSC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-HNSC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-HNSC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-HNSC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-HNSC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-HNSC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-HNSC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-HNSC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-HNSC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-HNSC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-HNSC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'KICH(Kidney Chromophobe)',id: "1_KICH"
	          ,children: [
{title:'TCGA',id:'TCGA_KICH',children: [
{title:'mRNAsi',id:'TCGA-KICH_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-KICH_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_KICH_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-KICH_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-KICH_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-KICH_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-KICH_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-KICH_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-KICH_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-KICH_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-KICH_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-KICH_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-KICH_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-KICH_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-KICH_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-KICH_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-KICH_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-KICH_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-KICH_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-KICH_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-KICH_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-KICH_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-KICH_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'KIRC(Kidney Clear Cell Carcinoma)',id: "1_KIRC"
	          ,children: [
{title:'TCGA',id:'TCGA_KIRC',children: [
{title:'mRNAsi',id:'TCGA-KIRC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-KIRC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_KIRC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-KIRC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-KIRC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-KIRC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-KIRC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-KIRC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-KIRC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-KIRC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-KIRC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-KIRC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-KIRC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-KIRC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-KIRC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-KIRC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-KIRC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-KIRC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-KIRC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-KIRC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-KIRC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-KIRC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-KIRC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'KIRP(Kidney Papillary Cell Carcinoma)',id: "1_KIRP"
	          ,children: [
{title:'TCGA',id:'TCGA_KIRP',children: [
{title:'mRNAsi',id:'TCGA-KIRP_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-KIRP_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_KIRP_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-KIRP_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-KIRP_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-KIRP_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-KIRP_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-KIRP_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-KIRP_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-KIRP_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-KIRP_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-KIRP_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-KIRP_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-KIRP_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-KIRP_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-KIRP_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-KIRP_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-KIRP_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-KIRP_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-KIRP_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-KIRP_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-KIRP_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-KIRP_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LAML(Acute Myeloid Leukemia)',id: "1_LAML"
	          ,children: [
{title:'TCGA',id:'TCGA_LAML',children: [
{title:'mRNAsi',id:'TCGA-LAML_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-LAML_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_LAML_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-LAML_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-LAML_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-LAML_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-LAML_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-LAML_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-LAML_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-LAML_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-LAML_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-LAML_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-LAML_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-LAML_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-LAML_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-LAML_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-LAML_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-LAML_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-LAML_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-LAML_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-LAML_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-LAML_gsva_last'},
{title:'VeneziaHSC_cPsig_m2h',id:'VeneziaHSC_cPsig_m2h_of_TCGA-LAML_gsva_last'},
{title:'VeneziaHSC_ES_m2h',id:'VeneziaHSC_ES_m2h_of_TCGA-LAML_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-LAML_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LGG(Lower Grade Glioma)',id: "1_LGG"
	          ,children: [
{title:'TCGA',id:'TCGA_LGG',children: [
{title:'mRNAsi',id:'TCGA-LGG_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-LGG_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_LGG_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-LGG_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-LGG_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-LGG_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-LGG_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-LGG_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-LGG_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-LGG_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-LGG_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-LGG_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-LGG_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-LGG_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-LGG_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-LGG_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-LGG_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-LGG_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-LGG_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-LGG_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-LGG_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-LGG_gsva_last'},
{title:'Yan_CD133_GBM_up',id:'Yan_CD133_GBM_up_of_TCGA-LGG_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-LGG_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LICA(Liver Cancer)',id: "1_LICA"
	          ,children: [
{title:'ICGC',id:'ICGC_LICA',children: [
{title:'mRNAsi',id:'ICGC-LICA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-LICA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_LICA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-LICA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-LICA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-LICA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-LICA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-LICA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-LICA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-LICA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-LICA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-LICA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-LICA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-LICA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-LICA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-LICA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-LICA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-LICA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-LICA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-LICA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-LICA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-LICA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-LICA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LIHC(Liver Cancer)',id: "1_LIHC"
	          ,children: [
{title:'TCGA',id:'TCGA_LIHC',children: [
{title:'mRNAsi',id:'TCGA-LIHC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-LIHC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_LIHC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-LIHC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-LIHC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-LIHC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-LIHC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-LIHC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-LIHC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-LIHC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-LIHC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-LIHC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-LIHC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-LIHC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-LIHC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-LIHC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-LIHC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-LIHC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-LIHC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-LIHC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-LIHC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-LIHC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-LIHC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LIRI(Liver Cancer)',id: "1_LIRI"
	          ,children: [
{title:'ICGC',id:'ICGC_LIRI',children: [
{title:'mRNAsi',id:'ICGC-LIRI_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-LIRI_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_LIRI_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-LIRI_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-LIRI_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-LIRI_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-LIRI_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-LIRI_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-LIRI_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-LIRI_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-LIRI_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-LIRI_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-LIRI_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-LIRI_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-LIRI_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-LIRI_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-LIRI_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-LIRI_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-LIRI_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-LIRI_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-LIRI_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-LIRI_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-LIRI_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LUAD(Lung Adenocarcinoma)',id: "1_LUAD"
	          ,children: [
{title:'TCGA',id:'TCGA_LUAD',children: [
{title:'mRNAsi',id:'TCGA-LUAD_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-LUAD_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_LUAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-LUAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-LUAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-LUAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-LUAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-LUAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-LUAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-LUAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-LUAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-LUAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-LUAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-LUAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-LUAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-LUAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-LUAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-LUAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-LUAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-LUAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-LUAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-LUAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-LUAD_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'LUSC(Lung Squamous Cell Carcinoma)',id: "1_LUSC"
	          ,children: [
{title:'TCGA',id:'TCGA_LUSC',children: [
{title:'mRNAsi',id:'TCGA-LUSC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-LUSC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_LUSC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-LUSC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-LUSC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-LUSC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-LUSC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-LUSC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-LUSC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-LUSC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-LUSC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-LUSC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-LUSC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-LUSC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-LUSC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-LUSC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-LUSC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-LUSC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-LUSC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-LUSC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-LUSC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-LUSC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-LUSC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'MALY(Malignant Lymphoma)',id: "1_MALY"
	          ,children: [
{title:'ICGC',id:'ICGC_MALY',children: [
{title:'mRNAsi',id:'ICGC-MALY_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-MALY_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_MALY_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-MALY_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-MALY_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-MALY_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-MALY_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-MALY_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-MALY_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-MALY_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-MALY_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-MALY_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-MALY_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-MALY_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-MALY_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-MALY_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-MALY_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-MALY_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-MALY_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-MALY_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-MALY_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-MALY_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-MALY_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'MESO(Mesothelioma)',id: "1_MESO"
	          ,children: [
{title:'TCGA',id:'TCGA_MESO',children: [
{title:'mRNAsi',id:'TCGA-MESO_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-MESO_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_MESO_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-MESO_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-MESO_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-MESO_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-MESO_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-MESO_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-MESO_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-MESO_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-MESO_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-MESO_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-MESO_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-MESO_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-MESO_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-MESO_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-MESO_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-MESO_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-MESO_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-MESO_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-MESO_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-MESO_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-MESO_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'ORCA(Oral Cancer)',id: "1_ORCA"
	          ,children: [
{title:'ICGC',id:'ICGC_ORCA',children: [
{title:'mRNAsi',id:'ICGC-ORCA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-ORCA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_ORCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-ORCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-ORCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-ORCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-ORCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-ORCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-ORCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-ORCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-ORCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-ORCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-ORCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-ORCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-ORCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-ORCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-ORCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-ORCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-ORCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-ORCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-ORCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-ORCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-ORCA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'OV(Ovarian Cancer)',id: "1_OV"
	          ,children: [
{title:'TCGA',id:'TCGA_OV',children: [
{title:'mRNAsi',id:'TCGA-OV_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-OV_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_OV_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-OV_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-OV_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-OV_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-OV_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-OV_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-OV_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-OV_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-OV_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-OV_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-OV_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-OV_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-OV_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-OV_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-OV_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-OV_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-OV_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-OV_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-OV_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-OV_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-OV_gsva_last'}
]
}]},
{title:'ICGC',id:'ICGC_OV',children: [
{title:'mRNAsi',id:'ICGC-OV_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-OV_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_OV_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-OV_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-OV_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-OV_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-OV_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-OV_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-OV_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-OV_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-OV_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-OV_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-OV_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-OV_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-OV_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-OV_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-OV_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-OV_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-OV_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-OV_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-OV_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-OV_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-OV_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'PAAD(Pancreatic adenocarcinoma)',id: "1_PAAD"
	          ,children: [
{title:'TCGA',id:'TCGA_PAAD',children: [
{title:'mRNAsi',id:'TCGA-PAAD_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-PAAD_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_PAAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-PAAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-PAAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-PAAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-PAAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-PAAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-PAAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-PAAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-PAAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-PAAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-PAAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-PAAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-PAAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-PAAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-PAAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-PAAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-PAAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-PAAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-PAAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-PAAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-PAAD_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'PACA(Pancreatic Cancer)',id: "1_PACA"
	          ,children: [
{title:'ICGC1',id:'ICGC1_PACA',children: [
{title:'mRNAsi',id:'ICGC1-PACA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC1-PACA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC1_PACA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC1-PACA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC1-PACA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC1-PACA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC1-PACA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC1-PACA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC1-PACA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC1-PACA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC1-PACA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC1-PACA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC1-PACA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC1-PACA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC1-PACA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC1-PACA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC1-PACA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC1-PACA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC1-PACA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC1-PACA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC1-PACA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC1-PACA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC1-PACA_gsva_last'}
]
}]},
{title:'ICGC2',id:'ICGA2_PACA',children: [
{title:'mRNAsi',id:'ICGC2-PACA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC2-PACA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC2_PACA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC2-PACA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC2-PACA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC2-PACA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC2-PACA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC2-PACA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC2-PACA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC2-PACA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC2-PACA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC2-PACA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC2-PACA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC2-PACA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC2-PACA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC2-PACA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC2-PACA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC2-PACA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC2-PACA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC2-PACA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC2-PACA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC2-PACA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC2-PACA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'PAEN(Pancreatic Cancer Endocrine neoplasms)',id: "1_PAEN"
	          ,children: [
{title:'ICGC',id:'ICGC_PAEN',children: [
{title:'mRNAsi',id:'ICGC-PAEN_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-PAEN_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_PAEN_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-PAEN_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-PAEN_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-PAEN_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-PAEN_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-PAEN_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-PAEN_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-PAEN_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-PAEN_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-PAEN_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-PAEN_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-PAEN_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-PAEN_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-PAEN_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-PAEN_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-PAEN_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-PAEN_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-PAEN_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-PAEN_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-PAEN_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-PAEN_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'PBCA(Pediatric Brain Cancer)',id: "1_PBCA"
	          ,children: [
{title:'ICGC',id:'ICGC_PBCA',children: [
{title:'mRNAsi',id:'ICGC-PBCA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-PBCA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_PBCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-PBCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-PBCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-PBCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-PBCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-PBCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-PBCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-PBCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-PBCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-PBCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-PBCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-PBCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-PBCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-PBCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-PBCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-PBCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-PBCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-PBCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-PBCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-PBCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-PBCA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'PCPG(Pheochromocytoma and Paraganglioma)',id: "1_PCPG"
	          ,children: [
{title:'TCGA',id:'TCGA_PCPG',children: [
{title:'mRNAsi',id:'TCGA-PCPG_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-PCPG_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_PCPG_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-PCPG_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-PCPG_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-PCPG_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-PCPG_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-PCPG_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-PCPG_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-PCPG_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-PCPG_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-PCPG_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-PCPG_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-PCPG_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-PCPG_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-PCPG_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-PCPG_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-PCPG_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-PCPG_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-PCPG_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-PCPG_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-PCPG_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-PCPG_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'PRAD(Prostate Cancer)',id: "1_PRAD"
	          ,children: [
{title:'TCGA',id:'TCGA_PRAD',children: [
{title:'mRNAsi',id:'TCGA-PRAD_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-PRAD_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_PRAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-PRAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-PRAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-PRAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-PRAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-PRAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-PRAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-PRAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-PRAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-PRAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-PRAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-PRAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-PRAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-PRAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-PRAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-PRAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-PRAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-PRAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-PRAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-PRAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-PRAD_gsva_last'}
]
}]},
{title:'ICGC1',id:'ICGC1_PRAD',children: [
{title:'mRNAsi',id:'ICGC1-PRAD_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC1-PRAD_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC1_PRAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC1-PRAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC1-PRAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC1-PRAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC1-PRAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC1-PRAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC1-PRAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC1-PRAD_gsva_last'}
]
}]},
{title:'ICGC2',id:'ICGC2_PRAD',children: [
{title:'mRNAsi',id:'ICGC2-PRAD_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC2-PRAD_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC2_PRAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC2-PRAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC2-PRAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC2-PRAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC2-PRAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC2-PRAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC2-PRAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC2-PRAD_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'READ(Rectal Cancer)',id: "1_READ"
	          ,children: [
{title:'TCGA',id:'TCGA_READ',children: [
{title:'mRNAsi',id:'TCGA-READ_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-READ_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_READ_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-READ_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-READ_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-READ_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-READ_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-READ_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-READ_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-READ_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-READ_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-READ_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-READ_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-READ_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-READ_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-READ_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-READ_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-READ_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-READ_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-READ_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-READ_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-READ_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-READ_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'RECA(Kidney cancer)',id: "1_RECA"
	          ,children: [
{title:'ICGC',id:'ICGC_RECA',children: [
{title:'mRNAsi',id:'ICGC-RECA_mRNAsi_last'},
{title:'StemnessIndex',id:'ICGC-RECA_StemnessIndexCS_last'},
{title:'GSVA',id:'ICGC_RECA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_ICGC-RECA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_ICGC-RECA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_ICGC-RECA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_ICGC-RECA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_ICGC-RECA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_ICGC-RECA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_ICGC-RECA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_ICGC-RECA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_ICGC-RECA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_ICGC-RECA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_ICGC-RECA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_ICGC-RECA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_ICGC-RECA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_ICGC-RECA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_ICGC-RECA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_ICGC-RECA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_ICGC-RECA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_ICGC-RECA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_ICGC-RECA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_ICGC-RECA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'SARC(Sarcoma)',id: "1_SARC"
	          ,children: [
{title:'TCGA',id:'TCGA_SARC',children: [
{title:'mRNAsi',id:'TCGA-SARC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-SARC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_SARC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-SARC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-SARC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-SARC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-SARC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-SARC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-SARC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-SARC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-SARC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-SARC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-SARC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-SARC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-SARC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-SARC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-SARC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-SARC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-SARC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-SARC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-SARC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-SARC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-SARC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'SKCM(Melanoma)',id: "1_SKCM"
	          ,children: [
{title:'TCGA',id:'TCGA_SKCM',children: [
{title:'mRNAsi',id:'TCGA-SKCM_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-SKCM_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_SKCM_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-SKCM_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-SKCM_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-SKCM_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-SKCM_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-SKCM_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-SKCM_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-SKCM_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-SKCM_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-SKCM_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-SKCM_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-SKCM_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-SKCM_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-SKCM_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-SKCM_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-SKCM_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-SKCM_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-SKCM_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-SKCM_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-SKCM_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-SKCM_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'STAD(Stomach Cancer)',id: "1_STAD"
	          ,children: [
{title:'TCGA',id:'TCGA_STAD',children: [
{title:'mRNAsi',id:'TCGA-STAD_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-STAD_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_STAD_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-STAD_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-STAD_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-STAD_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-STAD_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-STAD_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-STAD_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-STAD_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-STAD_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-STAD_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-STAD_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-STAD_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-STAD_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-STAD_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-STAD_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-STAD_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-STAD_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-STAD_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-STAD_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-STAD_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-STAD_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'TGCT(Testicular Cancer)',id: "1_TGCT"
	          ,children: [
{title:'TCGA',id:'TCGA_TGCT',children: [
{title:'mRNAsi',id:'TCGA-TGCT_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-TGCT_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_TGCT_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-TGCT_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-TGCT_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-TGCT_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-TGCT_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-TGCT_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-TGCT_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-TGCT_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-TGCT_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-TGCT_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-TGCT_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-TGCT_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-TGCT_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-TGCT_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-TGCT_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-TGCT_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-TGCT_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-TGCT_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-TGCT_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-TGCT_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-TGCT_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'THCA(Thyroid Cancer)',id: "1_THCA"
	          ,children: [
{title:'TCGA',id:'TCGA_THCA',children: [
{title:'mRNAsi',id:'TCGA-THCA_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-THCA_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_THCA_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-THCA_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-THCA_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-THCA_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-THCA_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-THCA_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-THCA_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-THCA_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-THCA_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-THCA_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-THCA_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-THCA_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-THCA_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-THCA_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-THCA_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-THCA_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-THCA_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-THCA_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-THCA_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-THCA_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-THCA_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'THYM(Thymoma)',id: "1_THYM"
	          ,children: [
{title:'TCGA',id:'TCGA_THYM',children: [
{title:'mRNAsi',id:'TCGA-THYM_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-THYM_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_THYM_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-THYM_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-THYM_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-THYM_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-THYM_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-THYM_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-THYM_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-THYM_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-THYM_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-THYM_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-THYM_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-THYM_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-THYM_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-THYM_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-THYM_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-THYM_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-THYM_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-THYM_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-THYM_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-THYM_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-THYM_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'UCEC(Endometrioid Cancer)',id: "1_UCEC"
	          ,children: [
{title:'TCGA',id:'TCGA_UCEC',children: [
{title:'mRNAsi',id:'TCGA-UCEC_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-UCEC_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_UCEC_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-UCEC_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-UCEC_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-UCEC_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-UCEC_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-UCEC_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-UCEC_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-UCEC_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-UCEC_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-UCEC_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-UCEC_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-UCEC_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-UCEC_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-UCEC_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-UCEC_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-UCEC_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-UCEC_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-UCEC_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-UCEC_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-UCEC_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-UCEC_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'UCS(Uterine Carcinosarcoma)',id: "1_UCS"
	          ,children: [
{title:'TCGA',id:'TCGA_UCS',children: [
{title:'mRNAsi',id:'TCGA-UCS_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-UCS_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_UCS_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-UCS_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-UCS_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-UCS_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-UCS_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-UCS_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-UCS_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-UCS_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-UCS_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-UCS_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-UCS_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-UCS_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-UCS_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-UCS_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-UCS_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-UCS_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-UCS_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-UCS_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-UCS_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-UCS_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-UCS_gsva_last'}
]
}]}
			  ]
	        },{
	          title: 'UVM(Uveal Melanoma)',id: "1_UVM"
	          ,children: [
{title:'TCGA',id:'TCGA_UVM',children: [
{title:'mRNAsi',id:'TCGA-UVM_mRNAsi_last'},
{title:'StemnessIndex',id:'TCGA-UVM_StemnessIndexCS_last'},
{title:'GSVA',id:'TCGA_UVM_gsva',children: [
{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_TCGA-UVM_gsva_last'},
{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_TCGA-UVM_gsva_last'},
{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_TCGA-UVM_gsva_last'},
{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_TCGA-UVM_gsva_last'},
{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_TCGA-UVM_gsva_last'},
{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_TCGA-UVM_gsva_last'},
{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_TCGA-UVM_gsva_last'},
{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_TCGA-UVM_gsva_last'},
{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_TCGA-UVM_gsva_last'},
{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_TCGA-UVM_gsva_last'},
{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_TCGA-UVM_gsva_last'},
{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_TCGA-UVM_gsva_last'},
{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_TCGA-UVM_gsva_last'},
{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_TCGA-UVM_gsva_last'},
{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_TCGA-UVM_gsva_last'},
{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_TCGA-UVM_gsva_last'},
{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_TCGA-UVM_gsva_last'},
{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_TCGA-UVM_gsva_last'},
{title:'Palme_SCGS',id:'Palme_SCGS_of_TCGA-UVM_gsva_last'},
{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_TCGA-UVM_gsva_last'}
]
}]}
			  ]
	        },
			
			]
	      },{
	        title: 'Single cell',id: "2_single"
	        ,children: [
			{title: 'BLCA(Bladder Cancer)',id: 3000,children:[
				{title:'GSE145137',id:'GSE145137',children:[
				{title:'CytoTRACE',id:'GSE145137_CytoTRACE_last'},
				{title:'SCENT',id:'GSE145137_SCENT_last'},
				{title:'SLICE',id:'GSE145137_SLICE_last'},
				{title:'StemSC',id:'GSE145137_StemSC_last'},
				{title:'GSVA',id:'GSE145137_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE145137_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE145137_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE145137_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE145137_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE145137_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE145137_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE145137_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE145137_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE145137_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE145137_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE145137_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE145137_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE145137_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE145137_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE145137_gsva_last'},
					{title:'Kim_et_al_core',id:'Kim_et_al_core_m2h_of_GSE145137_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE145137_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE145137_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE145137_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE145137_gsva_last'}
				]}
				]},
				{title:'GSE149652',id:'GSE149652',children:[
				{title:'CytoTRACE',id:'GSE149652_CytoTRACE_last'},
				{title:'SCENT',id:'GSE149652_SCENT_last'},
				{title:'SLICE',id:'GSE149652_SLICE_last'},
				{title:'StemSC',id:'GSE149652_StemSC_last'},
				{title:'GSVA',id:'GSE149652_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE149652_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE149652_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE149652_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE149652_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE149652_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE149652_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE149652_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE149652_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE149652_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE149652_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE149652_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE149652_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE149652_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE149652_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE149652_gsva_last'},
					{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE149652_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE149652_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE149652_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE149652_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE149652_gsva_last'}
				]}
				]}
			]},
			{title: 'BRCA(Breast Cancer)',id: 3000,children:[
				{title:'GSE75688',id:'GSE75688',children:[
				{title:'CytoTRACE',id:'GSE75688_CytoTRACE_last'},
				{title:'SCENT',id:'GSE75688_SCENT_last'},
				{title:'SLICE',id:'GSE75688_SLICE_last'},
				{title:'StemSC',id:'GSE75688_StemSC_last'},
				{title:'GSVA',id:'GSE75688_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE75688_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE75688_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE75688_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE75688_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE75688_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE75688_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE75688_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE75688_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE75688_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE75688_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE75688_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE75688_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE75688_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE75688_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE75688_gsva_last'},
					{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE75688_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE75688_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE75688_gsva_last'},
					{title:'Mizuno_iPSC118',id:'Mizuno_iPSC118_of_GSE75688_gsva_last'},
					{title:'Mizuno_iPSC340',id:'Mizuno_iPSC340_of_GSE75688_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE75688_gsva_last'},
					{title:'Shats_et_al_CSR',id:'Shats_et_al_CSR_of_GSE75688_gsva_last'},
					{title:'Shats_et_al_iPS',id:'Shats_et_al_iPS_of_GSE75688_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE75688_gsva_last'}
				]}
			]}
			]},
			{title: 'EPN(Ependymoma)',id: 3000,children:[
				{title:'GSE125969',id:'GSE125969',children:[
				{title:'CytoTRACE',id:'GSE125969_CytoTRACE_last'},
				{title:'SCENT',id:'GSE125969_SCENT_last'},
				{title:'SLICE',id:'GSE125969_SLICE_last'},
				{title:'StemSC',id:'GSE125969_StemSC_last'},
				{title:'GSVA',id:'GSE125969_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE125969_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE125969_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE125969_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE125969_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE125969_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE125969_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE125969_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE125969_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE125969_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE125969_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE125969_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE125969_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE125969_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE125969_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE125969_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE125969_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE125969_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE125969_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE125969_gsva_last'}
				]}
			]}
			]},
			{title: 'GBM(Glioblastoma)',id: 3000,children:[
				{title:'GSE84465',id:'GSE84465',children:[
				{title:'CytoTRACE',id:'GSE84465_CytoTRACE_last'},
				{title:'SCENT',id:'GSE84465_SCENT_last'},
				{title:'SLICE',id:'GSE84465_SLICE_last'},
				{title:'StemSC',id:'GSE84465_StemSC_last'},
				{title:'GSVA',id:'GSE84465_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE84465_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE84465_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE84465_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE84465_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE84465_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE84465_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE84465_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE84465_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE84465_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE84465_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE84465_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE84465_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE84465_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE84465_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE84465_gsva_last'},
					{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE84465_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE84465_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE84465_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE84465_gsva_last'},
					{title:'Yan_CD133_GBM_up',id:'Yan_CD133_GBM_up_of_GSE84465_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE84465_gsva_last'}
				]}
			]}
			]},
			{title: 'HNSC(Head and Neck Cancer)',id: 3000,children:[
				{title:'GSE103322',id:'GSE103322',children:[
				{title:'CytoTRACE',id:'GSE103322_CytoTRACE_last'},
				{title:'SCENT',id:'GSE103322_SCENT_last'},
				{title:'SLICE',id:'GSE103322_SLICE_last'},
				{title:'StemSC',id:'GSE103322_StemSC_last'},
				{title:'GSVA',id:'GSE103322_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE103322_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE103322_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE103322_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE103322_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE103322_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE103322_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE103322_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE103322_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE103322_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE103322_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE103322_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE103322_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE103322_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE103322_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE103322_gsva_last'},
					{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE103322_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE103322_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE103322_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE103322_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE103322_gsva_last'}
				]}
			]}
			]},
			{title: 'LAML(Acute Myeloid Leukemia)',id: 3000,children:[
				{title:'GSE116256',id:'GSE116256',children:[
				{title:'CytoTRACE',id:'GSE116256_CytoTRACE_last'},
				{title:'SCENT',id:'GSE116256_SCENT_last'},
				{title:'SLICE',id:'GSE116256_SLICE_last'},
				{title:'StemSC',id:'GSE116256_StemSC_last'},
				{title:'GSVA',id:'GSE116256_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE116256_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE116256_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE116256_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE116256_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE116256_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE116256_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE116256_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE116256_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE116256_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE116256_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE116256_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE116256_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE116256_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE116256_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE116256_gsva_last'},
					{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE116256_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE116256_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE116256_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE116256_gsva_last'},
					{title:'VeneziaHSC_cPsig_m2h',id:'VeneziaHSC_cPsig_m2h_of_GSE116256_gsva_last'},
					{title:'VeneziaHSC_ES_m2h',id:'VeneziaHSC_ES_m2h_of_GSE116256_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE116256_gsva_last'}
				]}
			]}
			]},
			{title: 'LIHC(Liver Cancer)',id: 3000,children:[
				{title:'GSE125449',id:'GSE125449',children:[
				{title:'CytoTRACE',id:'GSE125449_CytoTRACE_last'},
				{title:'SCENT',id:'GSE125449_SCENT_last'},
				{title:'SLICE',id:'GSE125449_SLICE_last'},
				{title:'StemSC',id:'GSE125449_StemSC_last'},
				{title:'GSVA',id:'GSE125449_gsva',children:[
					{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE125449_gsva_last'},
					{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE125449_gsva_last'},
					{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE125449_gsva_last'},
					{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE125449_gsva_last'},
					{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE125449_gsva_last'},
					{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE125449_gsva_last'},
					{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE125449_gsva_last'},
					{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE125449_gsva_last'},
					{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE125449_gsva_last'},
					{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE125449_gsva_last'},
					{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE125449_gsva_last'},
					{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE125449_gsva_last'},
					{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE125449_gsva_last'},
					{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE125449_gsva_last'},
					{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE125449_gsva_last'},
					{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE125449_gsva_last'},
					{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE125449_gsva_last'},
					{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE125449_gsva_last'},
					{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE125449_gsva_last'},
					{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE125449_gsva_last'}
				]}
			]}
			]},
			{title: 'MCC(Merkel Cell Carcinoma)',id: 3000,children:[
				{title:'GSE117988',id:'GSE117988',children:[
					{title:'CytoTRACE',id:'GSE117988_CytoTRACE_last'},
					{title:'SCENT',id:'GSE117988_SCENT_last'},
					{title:'SLICE',id:'GSE117988_SLICE_last'},
					{title:'StemSC',id:'GSE117988_StemSC_last'},
					{title:'GSVA',id:'GSE117988_gsva',children:[
						{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE117988_gsva_last'},
						{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE117988_gsva_last'},
						{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE117988_gsva_last'},
						{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE117988_gsva_last'},
						{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE117988_gsva_last'},
						{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE117988_gsva_last'},
						{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE117988_gsva_last'},
						{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE117988_gsva_last'},
						{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE117988_gsva_last'},
						{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE117988_gsva_last'},
						{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE117988_gsva_last'},
						{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE117988_gsva_last'},
						{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE117988_gsva_last'},
						{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE117988_gsva_last'},
						{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE117988_gsva_last'},
						{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE117988_gsva_last'},
						{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE117988_gsva_last'},
						{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE117988_gsva_last'},
						{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE117988_gsva_last'},
						{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE117988_gsva_last'}
				]}
				]},
				{title:'GSE118056',id:'GSE118056',children:[
					{title:'CytoTRACE',id:'GSE118056_CytoTRACE_last'},
					{title:'SCENT',id:'GSE118056_SCENT_last'},
					{title:'SLICE',id:'GSE118056_SLICE_last'},
					{title:'StemSC',id:'GSE118056_StemSC_last'},
					{title:'GSVA',id:'GSE118056_gsva',children:[
						{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE118056_gsva_last'},
						{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE118056_gsva_last'},
						{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE118056_gsva_last'},
						{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE118056_gsva_last'},
						{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE118056_gsva_last'},
						{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE118056_gsva_last'},
						{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE118056_gsva_last'},
						{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE118056_gsva_last'},
						{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE118056_gsva_last'},
						{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE118056_gsva_last'},
						{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE118056_gsva_last'},
						{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE118056_gsva_last'},
						{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE118056_gsva_last'},
						{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE118056_gsva_last'},
						{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE118056_gsva_last'},
						{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE118056_gsva_last'},
						{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE118056_gsva_last'},
						{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE118056_gsva_last'},
						{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE118056_gsva_last'},
						{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE118056_gsva_last'}
				]}
				]}
			]},
			{title: 'PRAD(Prostate Cancer)',id: 3000,children:[
				{title:'GSE137829',id:'GSE137829',children:[
					{title:'CytoTRACE',id:'GSE137829_CytoTRACE_last'},
					{title:'SCENT',id:'GSE137829_SCENT_last'},
					{title:'SLICE',id:'GSE137829_SLICE_last'},
					{title:'StemSC',id:'GSE137829_StemSC_last'},
					{title:'GSVA',id:'GSE137829_gsva',children:[
						{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE137829_gsva_last'},
						{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE137829_gsva_last'},
						{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE137829_gsva_last'},
						{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE137829_gsva_last'},
						{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE137829_gsva_last'},
						{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE137829_gsva_last'},
						{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE137829_gsva_last'},
						{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE137829_gsva_last'},
						{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE137829_gsva_last'},
						{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE137829_gsva_last'},
						{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE137829_gsva_last'},
						{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE137829_gsva_last'},
						{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE137829_gsva_last'},
						{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE137829_gsva_last'},
						{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE137829_gsva_last'},
						{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE137829_gsva_last'},
						{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE137829_gsva_last'},
						{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE137829_gsva_last'},
						{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE137829_gsva_last'},
						{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE137829_gsva_last'}
				]}
				]}
			]},
			{title: 'SKCM(Melanoma)',id: 3000,children:[
				{title:'GSE72056',id:'GSE72056',children:[
					{title:'CytoTRACE',id:'GSE72056_CytoTRACE_last'},
					{title:'SCENT',id:'GSE72056_SCENT_last'},
					{title:'SLICE',id:'GSE72056_SLICE_last'},
					{title:'StemSC',id:'GSE72056_StemSC_last'},
					{title:'GSVA',id:'GSE72056_gsva',children:[
						{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE72056_gsva_last'},
						{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE72056_gsva_last'},
						{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE72056_gsva_last'},
						{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE72056_gsva_last'},
						{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE72056_gsva_last'},
						{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE72056_gsva_last'},
						{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE72056_gsva_last'},
						{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE72056_gsva_last'},
						{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE72056_gsva_last'},
						{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE72056_gsva_last'},
						{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE72056_gsva_last'},
						{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE72056_gsva_last'},
						{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE72056_gsva_last'},
						{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE72056_gsva_last'},
						{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE72056_gsva_last'},
						{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE72056_gsva_last'},
						{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE72056_gsva_last'},
						{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE72056_gsva_last'},
						{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE72056_gsva_last'},
						{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE72056_gsva_last'}
				]}
				]},
				{title:'GSE115978',id:'GSE115978',children:[
					{title:'CytoTRACE',id:'GSE115978_CytoTRACE_last'},
					{title:'SCENT',id:'GSE115978_SCENT_last'},
					{title:'SLICE',id:'GSE115978_SLICE_last'},
					{title:'StemSC',id:'GSE115978_StemSC_last'},
					{title:'GSVA',id:'GSE115978_gsva',children:[
						{title:'Ben_Eed_targets',id:'Ben_Eed_targets_of_GSE115978_gsva_last'},
						{title:'Ben_ES_exp1',id:'Ben_ES_exp1_of_GSE115978_gsva_last'},
						{title:'Ben_ES_exp2',id:'Ben_ES_exp2_of_GSE115978_gsva_last'},
						{title:'Ben_ES_TFs',id:'Ben_ES_TFs_of_GSE115978_gsva_last'},
						{title:'Ben_H3K27_bound',id:'Ben_H3K27_bound_of_GSE115978_gsva_last'},
						{title:'Ben_Myc_targets1',id:'Ben_Myc_targets1_of_GSE115978_gsva_last'},
						{title:'Ben_Myc_targets2',id:'Ben_Myc_targets2_of_GSE115978_gsva_last'},
						{title:'Ben_Nanog_targets',id:'Ben_Nanog_targets_of_GSE115978_gsva_last'},
						{title:'Ben_NOS_targets',id:'Ben_NOS_targets_of_GSE115978_gsva_last'},
						{title:'Ben_NOS_TFs',id:'Ben_NOS_TFs_of_GSE115978_gsva_last'},
						{title:'Ben_Oct4_targets',id:'Ben_Oct4_targets_of_GSE115978_gsva_last'},
						{title:'Ben_PRC2_targets',id:'Ben_PRC2_targets_of_GSE115978_gsva_last'},
						{title:'Ben_Sox2_targets',id:'Ben_Sox2_targets_of_GSE115978_gsva_last'},
						{title:'Ben_Suz12_targets',id:'Ben_Suz12_targets_of_GSE115978_gsva_last'},
						{title:'Kim_ES_TFs_ref_m2h',id:'Kim_ES_TFs_ref_m2h_of_GSE115978_gsva_last'},
						{title:'Kim_et_al_core_m2h',id:'Kim_et_al_core_m2h_of_GSE115978_gsva_last'},
						{title:'Kim_et_al_Myc_m2h',id:'Kim_et_al_Myc_m2h_of_GSE115978_gsva_last'},
						{title:'Kim_et_al_PRC_m2h',id:'Kim_et_al_PRC_m2h_of_GSE115978_gsva_last'},
						{title:'Palme_SCGS',id:'Palme_SCGS_of_GSE115978_gsva_last'},
						{title:'Zhang_Stem_Sig',id:'Zhang_Stem_Sig_of_GSE115978_gsva_last'}
				]}
				]}
			]}
			]
	      }]
           //常规用法
  tree.render({
    elem: '#test1' //默认是点击节点可进行收缩
    ,data: data
    ,click: function(obj){
    	var id=obj.data.id;
    	var id_arr=id.split("_");
    	if(id_arr[id_arr.length-1]=="last"){
    		id_arr.pop();
    		var foldname="";
    		foldname=id_arr.join('_')
    		showResult(foldname);
    		}
        //console.log(obj.data); //得到当前点击的节点数据
        //obj.data.title
        //console.log(obj.state); //得到当前节点的展开状态：open、close、normal
        //console.log(obj.elem); //得到当前节点元素
        
        //console.log(obj.data.children); //当前节点下是否有子节点
      }
  });
});