// Reproducibility data and code for the article entitled "European Development Co-operation via Technical Assistance: An Outside-in Perspective"
// Year: 2022
// Journal: JCMS
// Author: Karina Shyrokykh (Stockholm University)
// Data structure: TSCS

xtset country_code YEAR


// Model 1
xtpoisson log_EVENTS log_requests polity2  log_pop log_gdp gov_eff pol_sta  trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, pa vce(robust) 

//Model 2
xtpoisson log_EVENTS Llog_requests polity2  log_pop log_gdp gov_eff pol_sta  trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, pa vce(robust) 

//Model 3
xtpoisson log_EVENTS LLlog_requests polity2  log_pop log_gdp gov_eff pol_sta trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, pa vce(robust) 

// Robustness check, Appendix Table E1, Model 1: distributed lag model
xtpoisson log_EVENTS log_requests Llog_requests LLlog_requests polity2  log_pop log_gdp gov_eff pol_sta trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, pa vce(robust) 

// Robustness check, Appendix Table E1, Model 2: time fe 
xtpoisson log_EVENTS log_requests polity2  log_pop log_gdp gov_eff pol_sta i.YEAR trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, pa vce(robust) 

// Robustness check, Appendix Table E1, Model 3: two-way fe 
xtpoisson log_EVENTS log_requests polity2  log_pop log_gdp gov_eff pol_sta i.YEAR trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, fe vce(robust) 

// Robustness check, Appendix Table E1, Model 4:  fe & LDV
xtpoisson log_EVENTS log_requests Llog_EVENTS polity2  log_pop log_gdp gov_eff pol_sta trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, fe 

// Robustness check, Appendix Table E1, Model 5: diff
xtpoisson log_EVENTS log_requests polity2  log_pop log_gdp gov_eff pol_sta YEAR trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner, fe vce(robust) 


//Model 4
xtpoisson log_requests  polity2  log_pop log_gdp gov_eff pol_sta trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner ///
REQS_TEAM_AGR REQS_TEAM_ETT  REQS_TEAM_INTMARKT REQS_TEAM_JHA, re vce(robust) 

// Robustness check, Appendix Table E3, Model 6: re
xtpoisson log_requests  log_EVENTS Llog_EVENTS polity2  log_pop log_gdp gov_eff pol_sta trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner ///
REQS_TEAM_AGR REQS_TEAM_ETT REQS_TEAM_INTMARKT REQS_TEAM_JHA , re vce(robust) 

// Robustness check, Appendix Table E3, Model 7: fe
xtpoisson log_requests Llog_EVENTS polity2  log_pop log_gdp gov_eff pol_sta trade_agreement ///
eligibility  memb_asp_new eu_potential_candidates_new eu_candidates_new intern_partner ///
REQS_TEAM_AGR REQS_TEAM_ETT REQS_TEAM_INTMARKT REQS_TEAM_JHA , fe vce(robust) 
