use super::super::prelude::*;

#[api_v2_operation(
  summary = "Domains",
  description = "Returns all ascella domains",
  consumes = "application/json, text/plain",
  produces = "application/json"
)]
#[get("/domains")]
pub async fn get() -> Result<HttpResponse, Error> {
  let data = get_domains::exec().await.unwrap();

  let data_domains = data
    .iter()
    .map(|domain| {
      json!({
          "apex":domain.apex,
          "owner": domain.owner,
          "domain": domain.domain
      })
    })
    .collect::<Vec<_>>();
  Ok(HttpResponse::Ok().json(&data_domains))
}