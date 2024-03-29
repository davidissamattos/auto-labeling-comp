// Ranking model
// Author: David Issa Mattos
// Date: 6 sept 2020
//
//

data {
 int <lower=1> N_total; // Sample size
 int y[N_total]; //variable that indicates which one wins model 0 or model 1

 int <lower=1> N_models; // Number of models
 
 int <lower=1> model0[N_total];
 int <lower=1> model1[N_total];
 
 // //To model the influence of each benchmark
 // int <lower=1> N_bm;
 // int bm_id[N_total];
}

parameters {
  real a_model[N_models]; //Latent variable that represents the strength value of each model
}

model {
  real p[N_total];

  a_model ~ normal(0,2);
  

  for (i in 1:N_total)
  {
     p[i] = a_model[model0[i]] - a_model[model1[i]];
  }
  
  y ~ bernoulli_logit(p);
}


//Uncoment this part to get the posterior predictives and the log likelihood
//But note that it takes a lot of space in the final model
// generated quantities{
//   vecor [N_total] y_rep;
//   vector[N_total] log_lik;
//   for(i in 1:N_total){
//     real p;
//     p = a_alg[algo1[i]] - a_alg[algo0[i]];
//     y_rep[i] = bernoulli_logit_rng(p);
//     
//     //Log likelihood
//      log_lik[i] = bernoulli_logit_lpmf(y[i] | p);
//   }
// }
