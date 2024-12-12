# install and read the httr2 package
install.packages("httr2")
library(httr2)

# Base URL and END-point
req <- request("https://planets-by-api-ninjas.p.rapidapi.com") %>%
  req_url_path("v1/planets") %>%
  req_url_query(name = "Venus") %>%
  req_headers('x-rapidapi-key' = '80500545d6msh9672dc5054d71aap1fb12ajsn0a02d36fa5f4', 
              'x-rapidapi-host' = 'planets-by-api-ninjas.p.rapidapi.com')

resp <- req %>%
  req_perform()
resp %>%
  resp_body_json()




# ------------------------------------------------------------------------------

req <- request("http://165.22.92.178:8080") %>%
  req_url_path("responses") %>%
  req_url_query(format = "json") %>%
  req_headers(authorization = "DM_DV_123#!")

response <- req %>%
  req_perform()
response %>%
  resp_body_json()

# ------------------------------------------------------------------------------
 # Data simulation

n <- 70
x1 <- rnorm(n=n)
x2 <- rnorm(n=n)
y <-2 * x1 + 3 * x2 + rnorm(n=n)
df <- round(data.frame(y = y, x1 = x1, x2 = x2))



req <- request("http://165.22.92.178:8080") %>%
  req_url_path("lm") %>%
  req_body_json(as.list(df)) %>%
  req_headers(authorization = "DM_DV_123#!")

resp <- req %>%
  req_perform()
resp %>%
  resp_body_json()

#-------------------------------------------------------------------------------

req <- request ("https://google-translate1.p.rapidapi.com/language/translate/v2/detect") %>%

req_headers('x-rapidapi-key' = '80500545d6msh9672dc5054d71aap1fb12ajsn0a02d36fa5f4', 
            'x-rapidapi-host' = 'google-translate1.p.rapidapi.com') %>%
  req_body_form(q = " dette er en test af detect-funktionen")
resp <- req %>%
  req_perform()
result <- resp %>%
  resp_body_json()
print(result)

