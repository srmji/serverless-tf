// GENERATED FILE: DO NOT EDIT

locals {
  // Variable setup
  path_root_list = "${split("/", path.root)}"
  path_root_len  = "${length(local.path_root_list)}"
  parent_dir     = "${element(local.path_root_list, local.path_root_len - 1)}"
  service_name   = "${var.service != "" ? var.service : local.parent_dir}"
  stage          = "${var.stage}"
  http_policy    = "${var.http_policy}"

  default_lambda_name = "${local.service_name}-serverless-tf"
  default_rebuild     = "never"
  default_s3_events   = "s3:ObjectRemoved:* s3:ObjectCreated:* s3:ReducedRedundancyLostObject"

  functions_length = "${length(var.functions)}"
  zero             = ["0"]
  zeros            = [{k=""},{k=""},{k=""},{k=""},{k=""},{k=""},{k=""},{k=""},{k=""},{k=""}]
  functions        = "${concat(var.functions, local.zeros)}"

  account_id = "${data.aws_caller_identity.current.account_id}"
}

// locals for lambda_0
locals {
  lambda_0 = "${local.functions[0]}"

  // Vars
  lambda_0_file         = "${lookup(local.lambda_0, "file", "")}"
  lambda_0_count        = "${local.lambda_0_file != "" ? 1 : 0}"
  lambda_0_vendor_cmd   = "${lookup(local.lambda_0, "vendor_cmd", "")}"
  lambda_0_test_cmd     = "${lookup(local.lambda_0, "test_cmd", "")}"
  lambda_0_timeout      = "${lookup(local.lambda_0, "timeout", "5")}"
  lambda_0_name         = "${lookup(local.lambda_0, "name", "")}"
  lambda_0_runtime      = "${lookup(local.lambda_0, "runtime", "")}"
  lambda_0_handler      = "${lookup(local.lambda_0, "handler", "")}"
  lambda_0_rebuild      = "${lookup(local.lambda_0, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_0_role_arn     = "${lookup(local.lambda_0, "role_arn", "")}"
  lambda_0_dir          = "${dirname(local.lambda_0_file)}"
  lambda_0_arn          = "arn:aws:lambda:${local.lambda_0_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_0_name_computed}"
  lambda_0_file_replace = "${replace(replace(replace(replace(replace(local.lambda_0_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_0_env_keys             = "${lookup(local.lambda_0, "env_keys", "AUTHOR")}"
  lambda_0_env_vals             = "${lookup(local.lambda_0, "env_vals", "rms1000watt")}"
  lambda_0_env_keys_list        = "${split(" ", local.lambda_0_env_keys)}"
  lambda_0_env_vals_list        = "${split(" ", local.lambda_0_env_vals)}"
  lambda_0_env_keys_list_length = "${length(local.lambda_0_env_keys_list)}"
  lambda_0_env_vals_list_length = "${length(local.lambda_0_env_vals_list)}"
  lambda_0_env                  = "${zipmap(local.lambda_0_env_keys_list, local.lambda_0_env_vals_list)}"

  lambda_0_region_in   = "${lookup(local.lambda_0, "region", "")}"
  lambda_0_region      = "${local.lambda_0_region_in != "" ? local.lambda_0_region_in  : data.aws_region.current.name}"
  lambda_0_same_region = "${local.lambda_0_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_0         = "${contains(split(".", local.lambda_0_file), "go")}"
  lambda_go_0_count   = "${local.lambda_go_0 ? 1 : 0}"
  lambda_go_0_name    = "${local.lambda_go_0 && local.lambda_0_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_0_name}" : "${local.service_name}-${local.stage}-${local.lambda_0_file_replace}-0" }" //"
  lambda_go_0_runtime = "${local.lambda_go_0 && local.lambda_0_runtime != "" ? local.lambda_0_runtime : "go1.x" }"
  lambda_go_0_handler = "${local.lambda_go_0 && local.lambda_0_handler != "" ? local.lambda_0_handler : local.lambda_go_0_name}"
  lambda_go_0_bin     = "${path.root}/bin/${local.lambda_go_0_name}"
  lambda_go_0_zip     = "${local.lambda_go_0 ? "${path.root}/.terraform/archive_files/${local.lambda_go_0_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_0             = "${contains(split(".", local.lambda_0_file), "py")}"
  lambda_py_0_count       = "${local.lambda_py_0 ? 1 : 0}"
  lambda_py_0_name        = "${local.lambda_py_0 && local.lambda_0_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_0_name}" : "${local.service_name}-${local.stage}-${local.lambda_0_file_replace}-0" }" //"
  lambda_py_0_runtime     = "${local.lambda_py_0 && local.lambda_0_runtime != "" ? local.lambda_0_runtime : "python3.6" }"
  lambda_py_0_handler     = "${local.lambda_py_0 && local.lambda_0_handler != "" ? local.lambda_0_handler : basename(replace(local.lambda_0_file, ".py", ".handler"))}"
  lambda_py_0_source_file = "${local.lambda_py_0 ? local.lambda_0_file : ""}"
  lambda_py_0_zip         = "${local.lambda_py_0 ? "${path.root}/.terraform/archive_files/${local.lambda_py_0_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_0             = "${contains(split(".", local.lambda_0_file), "js")}"
  lambda_js_0_count       = "${local.lambda_js_0 ? 1 : 0}"
  lambda_js_0_name        = "${local.lambda_js_0 && local.lambda_0_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_0_name}" : "${local.service_name}-${local.stage}-${local.lambda_0_file_replace}-0" }" //"
  lambda_js_0_runtime     = "${local.lambda_js_0 && local.lambda_0_runtime != "" ? local.lambda_0_runtime : "nodejs8.10" }"
  lambda_js_0_handler     = "${local.lambda_js_0 && local.lambda_0_handler != "" ? local.lambda_0_handler : basename(replace(local.lambda_0_file, ".js", ".handler"))}"
  lambda_js_0_source_file = "${local.lambda_js_0 ? local.lambda_0_file : ""}"
  lambda_js_0_zip         = "${local.lambda_js_0 ? "${path.root}/.terraform/archive_files/${local.lambda_js_0_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_0_name_computed = "${local.lambda_go_0 ? local.lambda_go_0_name : (local.lambda_py_0 ? local.lambda_py_0_name : (local.lambda_js_0 ? local.lambda_js_0_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_0                = "${lookup(local.lambda_0, "http", "" ) != "" || lookup(local.lambda_0, "http_path", "") != "" || lookup(local.lambda_0, "http_method", "") != "" || lookup(local.lambda_0, "http_authorizer", "") != "" || lookup(local.lambda_0, "http_stage", "") != ""}"
  api_gateway_0_count          = "${local.api_gateway_0 ? 1 : 0}"
  api_gateway_0_name           = "${local.lambda_0_name_computed}"
  api_gateway_0_path           = "${lookup(local.lambda_0, "http_path", local.lambda_0_name_computed)}"
  api_gateway_0_method         = "${upper(lookup(local.lambda_0, "http_method", "get"))}"
  api_gateway_0_stage          = "${local.stage}"
  api_gateway_0_metrics        = "${lookup(local.lambda_0, "http_metrics", "") != ""}"
  api_gateway_0_logging        = "${lookup(local.lambda_0, "http_logging", "") != ""}"
  api_gateway_0_logging_level  = "${local.api_gateway_0_logging ? "INFO" : "OFF"}"
  api_gateway_0_regional_count = "${local.lambda_0_same_region ? 0 : 1}"
  api_gateway_0_global_count   = "${local.lambda_0_same_region ? 1 : 0}"

  api_gateway_0_authorizer                  = "${lookup(local.lambda_0, "http_authorizer", "")}"
  api_gateway_0_authorizer_count            = "${local.api_gateway_0_authorizer != "" ? 1 : 0}"
  api_gateway_0_authorization               = "${local.api_gateway_0_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_0_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_0_authorizer}"
  api_gateway_0_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_0_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_0_authorizer_full_name}"
  api_gateway_0_authorizer_uri              = "arn:aws:apigateway:${local.lambda_0_region}:lambda:path/2015-03-31/functions/${local.api_gateway_0_authorizer_lambda_arn}/invocations"
  api_gateway_0_authorizer_policy_arn       = "${lookup(local.lambda_0, "http_authorizer_policy_arn", "")}"
  api_gateway_0_authorizer_policy_arn_count = "${local.api_gateway_0_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_0       = "${lookup(local.lambda_0, "schedule", "" ) != "" || lookup(local.lambda_0, "schedule_rate", "") != ""}"
  cloudwatch_0_count = "${local.cloudwatch_0 ? 1 : 0}"
  cloudwatch_0_name  = "${local.lambda_0_name_computed}"
  cloudwatch_0_rate  = "${lookup(local.lambda_0, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_0_bucket      = "${lookup(local.lambda_0, "s3_bucket", "")}"
  s3_0_bucket_arn  = "arn:aws:s3:::${local.s3_0_bucket}"
  s3_0_count       = "${local.s3_0_bucket != "" ? 1 : 0}"
  s3_0_prefix      = "${lookup(local.lambda_0, "s3_prefix", "")}"
  s3_0_suffix      = "${lookup(local.lambda_0, "s3_suffix", "")}"
  s3_0_events      = "${lookup(local.lambda_0, "s3_events", local.default_s3_events)}"
  s3_0_events_list = "${split(" ", local.s3_0_events)}"

  // Cloudwatch Event
  cloudwatch_event_0         = "${local.cloudwatch_event_0_pattern != ""}"
  cloudwatch_event_0_count   = "${local.cloudwatch_event_0 ? 1 : 0}"
  cloudwatch_event_0_name    = "${local.lambda_0_name_computed}"
  cloudwatch_event_0_pattern = "${lookup(local.lambda_0, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_1
locals {
  lambda_1 = "${local.functions[1]}"

  // Vars
  lambda_1_file         = "${lookup(local.lambda_1, "file", "")}"
  lambda_1_count        = "${local.lambda_1_file != "" ? 1 : 0}"
  lambda_1_vendor_cmd   = "${lookup(local.lambda_1, "vendor_cmd", "")}"
  lambda_1_test_cmd     = "${lookup(local.lambda_1, "test_cmd", "")}"
  lambda_1_timeout      = "${lookup(local.lambda_1, "timeout", "5")}"
  lambda_1_name         = "${lookup(local.lambda_1, "name", "")}"
  lambda_1_runtime      = "${lookup(local.lambda_1, "runtime", "")}"
  lambda_1_handler      = "${lookup(local.lambda_1, "handler", "")}"
  lambda_1_rebuild      = "${lookup(local.lambda_1, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_1_role_arn     = "${lookup(local.lambda_1, "role_arn", "")}"
  lambda_1_dir          = "${dirname(local.lambda_1_file)}"
  lambda_1_arn          = "arn:aws:lambda:${local.lambda_1_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_1_name_computed}"
  lambda_1_file_replace = "${replace(replace(replace(replace(replace(local.lambda_1_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_1_env_keys             = "${lookup(local.lambda_1, "env_keys", "AUTHOR")}"
  lambda_1_env_vals             = "${lookup(local.lambda_1, "env_vals", "rms1000watt")}"
  lambda_1_env_keys_list        = "${split(" ", local.lambda_1_env_keys)}"
  lambda_1_env_vals_list        = "${split(" ", local.lambda_1_env_vals)}"
  lambda_1_env_keys_list_length = "${length(local.lambda_1_env_keys_list)}"
  lambda_1_env_vals_list_length = "${length(local.lambda_1_env_vals_list)}"
  lambda_1_env                  = "${zipmap(local.lambda_1_env_keys_list, local.lambda_1_env_vals_list)}"

  lambda_1_region_in   = "${lookup(local.lambda_1, "region", "")}"
  lambda_1_region      = "${local.lambda_1_region_in != "" ? local.lambda_1_region_in  : data.aws_region.current.name}"
  lambda_1_same_region = "${local.lambda_1_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_1         = "${contains(split(".", local.lambda_1_file), "go")}"
  lambda_go_1_count   = "${local.lambda_go_1 ? 1 : 0}"
  lambda_go_1_name    = "${local.lambda_go_1 && local.lambda_1_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_1_name}" : "${local.service_name}-${local.stage}-${local.lambda_1_file_replace}-1" }" //"
  lambda_go_1_runtime = "${local.lambda_go_1 && local.lambda_1_runtime != "" ? local.lambda_1_runtime : "go1.x" }"
  lambda_go_1_handler = "${local.lambda_go_1 && local.lambda_1_handler != "" ? local.lambda_1_handler : local.lambda_go_1_name}"
  lambda_go_1_bin     = "${path.root}/bin/${local.lambda_go_1_name}"
  lambda_go_1_zip     = "${local.lambda_go_1 ? "${path.root}/.terraform/archive_files/${local.lambda_go_1_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_1             = "${contains(split(".", local.lambda_1_file), "py")}"
  lambda_py_1_count       = "${local.lambda_py_1 ? 1 : 0}"
  lambda_py_1_name        = "${local.lambda_py_1 && local.lambda_1_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_1_name}" : "${local.service_name}-${local.stage}-${local.lambda_1_file_replace}-1" }" //"
  lambda_py_1_runtime     = "${local.lambda_py_1 && local.lambda_1_runtime != "" ? local.lambda_1_runtime : "python3.6" }"
  lambda_py_1_handler     = "${local.lambda_py_1 && local.lambda_1_handler != "" ? local.lambda_1_handler : basename(replace(local.lambda_1_file, ".py", ".handler"))}"
  lambda_py_1_source_file = "${local.lambda_py_1 ? local.lambda_1_file : ""}"
  lambda_py_1_zip         = "${local.lambda_py_1 ? "${path.root}/.terraform/archive_files/${local.lambda_py_1_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_1             = "${contains(split(".", local.lambda_1_file), "js")}"
  lambda_js_1_count       = "${local.lambda_js_1 ? 1 : 0}"
  lambda_js_1_name        = "${local.lambda_js_1 && local.lambda_1_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_1_name}" : "${local.service_name}-${local.stage}-${local.lambda_1_file_replace}-1" }" //"
  lambda_js_1_runtime     = "${local.lambda_js_1 && local.lambda_1_runtime != "" ? local.lambda_1_runtime : "nodejs8.10" }"
  lambda_js_1_handler     = "${local.lambda_js_1 && local.lambda_1_handler != "" ? local.lambda_1_handler : basename(replace(local.lambda_1_file, ".js", ".handler"))}"
  lambda_js_1_source_file = "${local.lambda_js_1 ? local.lambda_1_file : ""}"
  lambda_js_1_zip         = "${local.lambda_js_1 ? "${path.root}/.terraform/archive_files/${local.lambda_js_1_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_1_name_computed = "${local.lambda_go_1 ? local.lambda_go_1_name : (local.lambda_py_1 ? local.lambda_py_1_name : (local.lambda_js_1 ? local.lambda_js_1_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_1                = "${lookup(local.lambda_1, "http", "" ) != "" || lookup(local.lambda_1, "http_path", "") != "" || lookup(local.lambda_1, "http_method", "") != "" || lookup(local.lambda_1, "http_authorizer", "") != "" || lookup(local.lambda_1, "http_stage", "") != ""}"
  api_gateway_1_count          = "${local.api_gateway_1 ? 1 : 0}"
  api_gateway_1_name           = "${local.lambda_1_name_computed}"
  api_gateway_1_path           = "${lookup(local.lambda_1, "http_path", local.lambda_1_name_computed)}"
  api_gateway_1_method         = "${upper(lookup(local.lambda_1, "http_method", "get"))}"
  api_gateway_1_stage          = "${local.stage}"
  api_gateway_1_metrics        = "${lookup(local.lambda_1, "http_metrics", "") != ""}"
  api_gateway_1_logging        = "${lookup(local.lambda_1, "http_logging", "") != ""}"
  api_gateway_1_logging_level  = "${local.api_gateway_1_logging ? "INFO" : "OFF"}"
  api_gateway_1_regional_count = "${local.lambda_1_same_region ? 0 : 1}"
  api_gateway_1_global_count   = "${local.lambda_1_same_region ? 1 : 0}"

  api_gateway_1_authorizer                  = "${lookup(local.lambda_1, "http_authorizer", "")}"
  api_gateway_1_authorizer_count            = "${local.api_gateway_1_authorizer != "" ? 1 : 0}"
  api_gateway_1_authorization               = "${local.api_gateway_1_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_1_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_1_authorizer}"
  api_gateway_1_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_1_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_1_authorizer_full_name}"
  api_gateway_1_authorizer_uri              = "arn:aws:apigateway:${local.lambda_1_region}:lambda:path/2015-03-31/functions/${local.api_gateway_1_authorizer_lambda_arn}/invocations"
  api_gateway_1_authorizer_policy_arn       = "${lookup(local.lambda_1, "http_authorizer_policy_arn", "")}"
  api_gateway_1_authorizer_policy_arn_count = "${local.api_gateway_1_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_1       = "${lookup(local.lambda_1, "schedule", "" ) != "" || lookup(local.lambda_1, "schedule_rate", "") != ""}"
  cloudwatch_1_count = "${local.cloudwatch_1 ? 1 : 0}"
  cloudwatch_1_name  = "${local.lambda_1_name_computed}"
  cloudwatch_1_rate  = "${lookup(local.lambda_1, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_1_bucket      = "${lookup(local.lambda_1, "s3_bucket", "")}"
  s3_1_bucket_arn  = "arn:aws:s3:::${local.s3_1_bucket}"
  s3_1_count       = "${local.s3_1_bucket != "" ? 1 : 0}"
  s3_1_prefix      = "${lookup(local.lambda_1, "s3_prefix", "")}"
  s3_1_suffix      = "${lookup(local.lambda_1, "s3_suffix", "")}"
  s3_1_events      = "${lookup(local.lambda_1, "s3_events", local.default_s3_events)}"
  s3_1_events_list = "${split(" ", local.s3_1_events)}"

  // Cloudwatch Event
  cloudwatch_event_1         = "${local.cloudwatch_event_1_pattern != ""}"
  cloudwatch_event_1_count   = "${local.cloudwatch_event_1 ? 1 : 0}"
  cloudwatch_event_1_name    = "${local.lambda_1_name_computed}"
  cloudwatch_event_1_pattern = "${lookup(local.lambda_1, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_2
locals {
  lambda_2 = "${local.functions[2]}"

  // Vars
  lambda_2_file         = "${lookup(local.lambda_2, "file", "")}"
  lambda_2_count        = "${local.lambda_2_file != "" ? 1 : 0}"
  lambda_2_vendor_cmd   = "${lookup(local.lambda_2, "vendor_cmd", "")}"
  lambda_2_test_cmd     = "${lookup(local.lambda_2, "test_cmd", "")}"
  lambda_2_timeout      = "${lookup(local.lambda_2, "timeout", "5")}"
  lambda_2_name         = "${lookup(local.lambda_2, "name", "")}"
  lambda_2_runtime      = "${lookup(local.lambda_2, "runtime", "")}"
  lambda_2_handler      = "${lookup(local.lambda_2, "handler", "")}"
  lambda_2_rebuild      = "${lookup(local.lambda_2, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_2_role_arn     = "${lookup(local.lambda_2, "role_arn", "")}"
  lambda_2_dir          = "${dirname(local.lambda_2_file)}"
  lambda_2_arn          = "arn:aws:lambda:${local.lambda_2_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_2_name_computed}"
  lambda_2_file_replace = "${replace(replace(replace(replace(replace(local.lambda_2_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_2_env_keys             = "${lookup(local.lambda_2, "env_keys", "AUTHOR")}"
  lambda_2_env_vals             = "${lookup(local.lambda_2, "env_vals", "rms1000watt")}"
  lambda_2_env_keys_list        = "${split(" ", local.lambda_2_env_keys)}"
  lambda_2_env_vals_list        = "${split(" ", local.lambda_2_env_vals)}"
  lambda_2_env_keys_list_length = "${length(local.lambda_2_env_keys_list)}"
  lambda_2_env_vals_list_length = "${length(local.lambda_2_env_vals_list)}"
  lambda_2_env                  = "${zipmap(local.lambda_2_env_keys_list, local.lambda_2_env_vals_list)}"

  lambda_2_region_in   = "${lookup(local.lambda_2, "region", "")}"
  lambda_2_region      = "${local.lambda_2_region_in != "" ? local.lambda_2_region_in  : data.aws_region.current.name}"
  lambda_2_same_region = "${local.lambda_2_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_2         = "${contains(split(".", local.lambda_2_file), "go")}"
  lambda_go_2_count   = "${local.lambda_go_2 ? 1 : 0}"
  lambda_go_2_name    = "${local.lambda_go_2 && local.lambda_2_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_2_name}" : "${local.service_name}-${local.stage}-${local.lambda_2_file_replace}-2" }" //"
  lambda_go_2_runtime = "${local.lambda_go_2 && local.lambda_2_runtime != "" ? local.lambda_2_runtime : "go1.x" }"
  lambda_go_2_handler = "${local.lambda_go_2 && local.lambda_2_handler != "" ? local.lambda_2_handler : local.lambda_go_2_name}"
  lambda_go_2_bin     = "${path.root}/bin/${local.lambda_go_2_name}"
  lambda_go_2_zip     = "${local.lambda_go_2 ? "${path.root}/.terraform/archive_files/${local.lambda_go_2_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_2             = "${contains(split(".", local.lambda_2_file), "py")}"
  lambda_py_2_count       = "${local.lambda_py_2 ? 1 : 0}"
  lambda_py_2_name        = "${local.lambda_py_2 && local.lambda_2_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_2_name}" : "${local.service_name}-${local.stage}-${local.lambda_2_file_replace}-2" }" //"
  lambda_py_2_runtime     = "${local.lambda_py_2 && local.lambda_2_runtime != "" ? local.lambda_2_runtime : "python3.6" }"
  lambda_py_2_handler     = "${local.lambda_py_2 && local.lambda_2_handler != "" ? local.lambda_2_handler : basename(replace(local.lambda_2_file, ".py", ".handler"))}"
  lambda_py_2_source_file = "${local.lambda_py_2 ? local.lambda_2_file : ""}"
  lambda_py_2_zip         = "${local.lambda_py_2 ? "${path.root}/.terraform/archive_files/${local.lambda_py_2_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_2             = "${contains(split(".", local.lambda_2_file), "js")}"
  lambda_js_2_count       = "${local.lambda_js_2 ? 1 : 0}"
  lambda_js_2_name        = "${local.lambda_js_2 && local.lambda_2_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_2_name}" : "${local.service_name}-${local.stage}-${local.lambda_2_file_replace}-2" }" //"
  lambda_js_2_runtime     = "${local.lambda_js_2 && local.lambda_2_runtime != "" ? local.lambda_2_runtime : "nodejs8.10" }"
  lambda_js_2_handler     = "${local.lambda_js_2 && local.lambda_2_handler != "" ? local.lambda_2_handler : basename(replace(local.lambda_2_file, ".js", ".handler"))}"
  lambda_js_2_source_file = "${local.lambda_js_2 ? local.lambda_2_file : ""}"
  lambda_js_2_zip         = "${local.lambda_js_2 ? "${path.root}/.terraform/archive_files/${local.lambda_js_2_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_2_name_computed = "${local.lambda_go_2 ? local.lambda_go_2_name : (local.lambda_py_2 ? local.lambda_py_2_name : (local.lambda_js_2 ? local.lambda_js_2_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_2                = "${lookup(local.lambda_2, "http", "" ) != "" || lookup(local.lambda_2, "http_path", "") != "" || lookup(local.lambda_2, "http_method", "") != "" || lookup(local.lambda_2, "http_authorizer", "") != "" || lookup(local.lambda_2, "http_stage", "") != ""}"
  api_gateway_2_count          = "${local.api_gateway_2 ? 1 : 0}"
  api_gateway_2_name           = "${local.lambda_2_name_computed}"
  api_gateway_2_path           = "${lookup(local.lambda_2, "http_path", local.lambda_2_name_computed)}"
  api_gateway_2_method         = "${upper(lookup(local.lambda_2, "http_method", "get"))}"
  api_gateway_2_stage          = "${local.stage}"
  api_gateway_2_metrics        = "${lookup(local.lambda_2, "http_metrics", "") != ""}"
  api_gateway_2_logging        = "${lookup(local.lambda_2, "http_logging", "") != ""}"
  api_gateway_2_logging_level  = "${local.api_gateway_2_logging ? "INFO" : "OFF"}"
  api_gateway_2_regional_count = "${local.lambda_2_same_region ? 0 : 1}"
  api_gateway_2_global_count   = "${local.lambda_2_same_region ? 1 : 0}"

  api_gateway_2_authorizer                  = "${lookup(local.lambda_2, "http_authorizer", "")}"
  api_gateway_2_authorizer_count            = "${local.api_gateway_2_authorizer != "" ? 1 : 0}"
  api_gateway_2_authorization               = "${local.api_gateway_2_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_2_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_2_authorizer}"
  api_gateway_2_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_2_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_2_authorizer_full_name}"
  api_gateway_2_authorizer_uri              = "arn:aws:apigateway:${local.lambda_2_region}:lambda:path/2015-03-31/functions/${local.api_gateway_2_authorizer_lambda_arn}/invocations"
  api_gateway_2_authorizer_policy_arn       = "${lookup(local.lambda_2, "http_authorizer_policy_arn", "")}"
  api_gateway_2_authorizer_policy_arn_count = "${local.api_gateway_2_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_2       = "${lookup(local.lambda_2, "schedule", "" ) != "" || lookup(local.lambda_2, "schedule_rate", "") != ""}"
  cloudwatch_2_count = "${local.cloudwatch_2 ? 1 : 0}"
  cloudwatch_2_name  = "${local.lambda_2_name_computed}"
  cloudwatch_2_rate  = "${lookup(local.lambda_2, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_2_bucket      = "${lookup(local.lambda_2, "s3_bucket", "")}"
  s3_2_bucket_arn  = "arn:aws:s3:::${local.s3_2_bucket}"
  s3_2_count       = "${local.s3_2_bucket != "" ? 1 : 0}"
  s3_2_prefix      = "${lookup(local.lambda_2, "s3_prefix", "")}"
  s3_2_suffix      = "${lookup(local.lambda_2, "s3_suffix", "")}"
  s3_2_events      = "${lookup(local.lambda_2, "s3_events", local.default_s3_events)}"
  s3_2_events_list = "${split(" ", local.s3_2_events)}"

  // Cloudwatch Event
  cloudwatch_event_2         = "${local.cloudwatch_event_2_pattern != ""}"
  cloudwatch_event_2_count   = "${local.cloudwatch_event_2 ? 1 : 0}"
  cloudwatch_event_2_name    = "${local.lambda_2_name_computed}"
  cloudwatch_event_2_pattern = "${lookup(local.lambda_2, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_3
locals {
  lambda_3 = "${local.functions[3]}"

  // Vars
  lambda_3_file         = "${lookup(local.lambda_3, "file", "")}"
  lambda_3_count        = "${local.lambda_3_file != "" ? 1 : 0}"
  lambda_3_vendor_cmd   = "${lookup(local.lambda_3, "vendor_cmd", "")}"
  lambda_3_test_cmd     = "${lookup(local.lambda_3, "test_cmd", "")}"
  lambda_3_timeout      = "${lookup(local.lambda_3, "timeout", "5")}"
  lambda_3_name         = "${lookup(local.lambda_3, "name", "")}"
  lambda_3_runtime      = "${lookup(local.lambda_3, "runtime", "")}"
  lambda_3_handler      = "${lookup(local.lambda_3, "handler", "")}"
  lambda_3_rebuild      = "${lookup(local.lambda_3, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_3_role_arn     = "${lookup(local.lambda_3, "role_arn", "")}"
  lambda_3_dir          = "${dirname(local.lambda_3_file)}"
  lambda_3_arn          = "arn:aws:lambda:${local.lambda_3_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_3_name_computed}"
  lambda_3_file_replace = "${replace(replace(replace(replace(replace(local.lambda_3_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_3_env_keys             = "${lookup(local.lambda_3, "env_keys", "AUTHOR")}"
  lambda_3_env_vals             = "${lookup(local.lambda_3, "env_vals", "rms1000watt")}"
  lambda_3_env_keys_list        = "${split(" ", local.lambda_3_env_keys)}"
  lambda_3_env_vals_list        = "${split(" ", local.lambda_3_env_vals)}"
  lambda_3_env_keys_list_length = "${length(local.lambda_3_env_keys_list)}"
  lambda_3_env_vals_list_length = "${length(local.lambda_3_env_vals_list)}"
  lambda_3_env                  = "${zipmap(local.lambda_3_env_keys_list, local.lambda_3_env_vals_list)}"

  lambda_3_region_in   = "${lookup(local.lambda_3, "region", "")}"
  lambda_3_region      = "${local.lambda_3_region_in != "" ? local.lambda_3_region_in  : data.aws_region.current.name}"
  lambda_3_same_region = "${local.lambda_3_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_3         = "${contains(split(".", local.lambda_3_file), "go")}"
  lambda_go_3_count   = "${local.lambda_go_3 ? 1 : 0}"
  lambda_go_3_name    = "${local.lambda_go_3 && local.lambda_3_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_3_name}" : "${local.service_name}-${local.stage}-${local.lambda_3_file_replace}-3" }" //"
  lambda_go_3_runtime = "${local.lambda_go_3 && local.lambda_3_runtime != "" ? local.lambda_3_runtime : "go1.x" }"
  lambda_go_3_handler = "${local.lambda_go_3 && local.lambda_3_handler != "" ? local.lambda_3_handler : local.lambda_go_3_name}"
  lambda_go_3_bin     = "${path.root}/bin/${local.lambda_go_3_name}"
  lambda_go_3_zip     = "${local.lambda_go_3 ? "${path.root}/.terraform/archive_files/${local.lambda_go_3_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_3             = "${contains(split(".", local.lambda_3_file), "py")}"
  lambda_py_3_count       = "${local.lambda_py_3 ? 1 : 0}"
  lambda_py_3_name        = "${local.lambda_py_3 && local.lambda_3_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_3_name}" : "${local.service_name}-${local.stage}-${local.lambda_3_file_replace}-3" }" //"
  lambda_py_3_runtime     = "${local.lambda_py_3 && local.lambda_3_runtime != "" ? local.lambda_3_runtime : "python3.6" }"
  lambda_py_3_handler     = "${local.lambda_py_3 && local.lambda_3_handler != "" ? local.lambda_3_handler : basename(replace(local.lambda_3_file, ".py", ".handler"))}"
  lambda_py_3_source_file = "${local.lambda_py_3 ? local.lambda_3_file : ""}"
  lambda_py_3_zip         = "${local.lambda_py_3 ? "${path.root}/.terraform/archive_files/${local.lambda_py_3_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_3             = "${contains(split(".", local.lambda_3_file), "js")}"
  lambda_js_3_count       = "${local.lambda_js_3 ? 1 : 0}"
  lambda_js_3_name        = "${local.lambda_js_3 && local.lambda_3_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_3_name}" : "${local.service_name}-${local.stage}-${local.lambda_3_file_replace}-3" }" //"
  lambda_js_3_runtime     = "${local.lambda_js_3 && local.lambda_3_runtime != "" ? local.lambda_3_runtime : "nodejs8.10" }"
  lambda_js_3_handler     = "${local.lambda_js_3 && local.lambda_3_handler != "" ? local.lambda_3_handler : basename(replace(local.lambda_3_file, ".js", ".handler"))}"
  lambda_js_3_source_file = "${local.lambda_js_3 ? local.lambda_3_file : ""}"
  lambda_js_3_zip         = "${local.lambda_js_3 ? "${path.root}/.terraform/archive_files/${local.lambda_js_3_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_3_name_computed = "${local.lambda_go_3 ? local.lambda_go_3_name : (local.lambda_py_3 ? local.lambda_py_3_name : (local.lambda_js_3 ? local.lambda_js_3_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_3                = "${lookup(local.lambda_3, "http", "" ) != "" || lookup(local.lambda_3, "http_path", "") != "" || lookup(local.lambda_3, "http_method", "") != "" || lookup(local.lambda_3, "http_authorizer", "") != "" || lookup(local.lambda_3, "http_stage", "") != ""}"
  api_gateway_3_count          = "${local.api_gateway_3 ? 1 : 0}"
  api_gateway_3_name           = "${local.lambda_3_name_computed}"
  api_gateway_3_path           = "${lookup(local.lambda_3, "http_path", local.lambda_3_name_computed)}"
  api_gateway_3_method         = "${upper(lookup(local.lambda_3, "http_method", "get"))}"
  api_gateway_3_stage          = "${local.stage}"
  api_gateway_3_metrics        = "${lookup(local.lambda_3, "http_metrics", "") != ""}"
  api_gateway_3_logging        = "${lookup(local.lambda_3, "http_logging", "") != ""}"
  api_gateway_3_logging_level  = "${local.api_gateway_3_logging ? "INFO" : "OFF"}"
  api_gateway_3_regional_count = "${local.lambda_3_same_region ? 0 : 1}"
  api_gateway_3_global_count   = "${local.lambda_3_same_region ? 1 : 0}"

  api_gateway_3_authorizer                  = "${lookup(local.lambda_3, "http_authorizer", "")}"
  api_gateway_3_authorizer_count            = "${local.api_gateway_3_authorizer != "" ? 1 : 0}"
  api_gateway_3_authorization               = "${local.api_gateway_3_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_3_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_3_authorizer}"
  api_gateway_3_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_3_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_3_authorizer_full_name}"
  api_gateway_3_authorizer_uri              = "arn:aws:apigateway:${local.lambda_3_region}:lambda:path/2015-03-31/functions/${local.api_gateway_3_authorizer_lambda_arn}/invocations"
  api_gateway_3_authorizer_policy_arn       = "${lookup(local.lambda_3, "http_authorizer_policy_arn", "")}"
  api_gateway_3_authorizer_policy_arn_count = "${local.api_gateway_3_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_3       = "${lookup(local.lambda_3, "schedule", "" ) != "" || lookup(local.lambda_3, "schedule_rate", "") != ""}"
  cloudwatch_3_count = "${local.cloudwatch_3 ? 1 : 0}"
  cloudwatch_3_name  = "${local.lambda_3_name_computed}"
  cloudwatch_3_rate  = "${lookup(local.lambda_3, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_3_bucket      = "${lookup(local.lambda_3, "s3_bucket", "")}"
  s3_3_bucket_arn  = "arn:aws:s3:::${local.s3_3_bucket}"
  s3_3_count       = "${local.s3_3_bucket != "" ? 1 : 0}"
  s3_3_prefix      = "${lookup(local.lambda_3, "s3_prefix", "")}"
  s3_3_suffix      = "${lookup(local.lambda_3, "s3_suffix", "")}"
  s3_3_events      = "${lookup(local.lambda_3, "s3_events", local.default_s3_events)}"
  s3_3_events_list = "${split(" ", local.s3_3_events)}"

  // Cloudwatch Event
  cloudwatch_event_3         = "${local.cloudwatch_event_3_pattern != ""}"
  cloudwatch_event_3_count   = "${local.cloudwatch_event_3 ? 1 : 0}"
  cloudwatch_event_3_name    = "${local.lambda_3_name_computed}"
  cloudwatch_event_3_pattern = "${lookup(local.lambda_3, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_4
locals {
  lambda_4 = "${local.functions[4]}"

  // Vars
  lambda_4_file         = "${lookup(local.lambda_4, "file", "")}"
  lambda_4_count        = "${local.lambda_4_file != "" ? 1 : 0}"
  lambda_4_vendor_cmd   = "${lookup(local.lambda_4, "vendor_cmd", "")}"
  lambda_4_test_cmd     = "${lookup(local.lambda_4, "test_cmd", "")}"
  lambda_4_timeout      = "${lookup(local.lambda_4, "timeout", "5")}"
  lambda_4_name         = "${lookup(local.lambda_4, "name", "")}"
  lambda_4_runtime      = "${lookup(local.lambda_4, "runtime", "")}"
  lambda_4_handler      = "${lookup(local.lambda_4, "handler", "")}"
  lambda_4_rebuild      = "${lookup(local.lambda_4, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_4_role_arn     = "${lookup(local.lambda_4, "role_arn", "")}"
  lambda_4_dir          = "${dirname(local.lambda_4_file)}"
  lambda_4_arn          = "arn:aws:lambda:${local.lambda_4_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_4_name_computed}"
  lambda_4_file_replace = "${replace(replace(replace(replace(replace(local.lambda_4_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_4_env_keys             = "${lookup(local.lambda_4, "env_keys", "AUTHOR")}"
  lambda_4_env_vals             = "${lookup(local.lambda_4, "env_vals", "rms1000watt")}"
  lambda_4_env_keys_list        = "${split(" ", local.lambda_4_env_keys)}"
  lambda_4_env_vals_list        = "${split(" ", local.lambda_4_env_vals)}"
  lambda_4_env_keys_list_length = "${length(local.lambda_4_env_keys_list)}"
  lambda_4_env_vals_list_length = "${length(local.lambda_4_env_vals_list)}"
  lambda_4_env                  = "${zipmap(local.lambda_4_env_keys_list, local.lambda_4_env_vals_list)}"

  lambda_4_region_in   = "${lookup(local.lambda_4, "region", "")}"
  lambda_4_region      = "${local.lambda_4_region_in != "" ? local.lambda_4_region_in  : data.aws_region.current.name}"
  lambda_4_same_region = "${local.lambda_4_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_4         = "${contains(split(".", local.lambda_4_file), "go")}"
  lambda_go_4_count   = "${local.lambda_go_4 ? 1 : 0}"
  lambda_go_4_name    = "${local.lambda_go_4 && local.lambda_4_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_4_name}" : "${local.service_name}-${local.stage}-${local.lambda_4_file_replace}-4" }" //"
  lambda_go_4_runtime = "${local.lambda_go_4 && local.lambda_4_runtime != "" ? local.lambda_4_runtime : "go1.x" }"
  lambda_go_4_handler = "${local.lambda_go_4 && local.lambda_4_handler != "" ? local.lambda_4_handler : local.lambda_go_4_name}"
  lambda_go_4_bin     = "${path.root}/bin/${local.lambda_go_4_name}"
  lambda_go_4_zip     = "${local.lambda_go_4 ? "${path.root}/.terraform/archive_files/${local.lambda_go_4_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_4             = "${contains(split(".", local.lambda_4_file), "py")}"
  lambda_py_4_count       = "${local.lambda_py_4 ? 1 : 0}"
  lambda_py_4_name        = "${local.lambda_py_4 && local.lambda_4_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_4_name}" : "${local.service_name}-${local.stage}-${local.lambda_4_file_replace}-4" }" //"
  lambda_py_4_runtime     = "${local.lambda_py_4 && local.lambda_4_runtime != "" ? local.lambda_4_runtime : "python3.6" }"
  lambda_py_4_handler     = "${local.lambda_py_4 && local.lambda_4_handler != "" ? local.lambda_4_handler : basename(replace(local.lambda_4_file, ".py", ".handler"))}"
  lambda_py_4_source_file = "${local.lambda_py_4 ? local.lambda_4_file : ""}"
  lambda_py_4_zip         = "${local.lambda_py_4 ? "${path.root}/.terraform/archive_files/${local.lambda_py_4_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_4             = "${contains(split(".", local.lambda_4_file), "js")}"
  lambda_js_4_count       = "${local.lambda_js_4 ? 1 : 0}"
  lambda_js_4_name        = "${local.lambda_js_4 && local.lambda_4_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_4_name}" : "${local.service_name}-${local.stage}-${local.lambda_4_file_replace}-4" }" //"
  lambda_js_4_runtime     = "${local.lambda_js_4 && local.lambda_4_runtime != "" ? local.lambda_4_runtime : "nodejs8.10" }"
  lambda_js_4_handler     = "${local.lambda_js_4 && local.lambda_4_handler != "" ? local.lambda_4_handler : basename(replace(local.lambda_4_file, ".js", ".handler"))}"
  lambda_js_4_source_file = "${local.lambda_js_4 ? local.lambda_4_file : ""}"
  lambda_js_4_zip         = "${local.lambda_js_4 ? "${path.root}/.terraform/archive_files/${local.lambda_js_4_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_4_name_computed = "${local.lambda_go_4 ? local.lambda_go_4_name : (local.lambda_py_4 ? local.lambda_py_4_name : (local.lambda_js_4 ? local.lambda_js_4_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_4                = "${lookup(local.lambda_4, "http", "" ) != "" || lookup(local.lambda_4, "http_path", "") != "" || lookup(local.lambda_4, "http_method", "") != "" || lookup(local.lambda_4, "http_authorizer", "") != "" || lookup(local.lambda_4, "http_stage", "") != ""}"
  api_gateway_4_count          = "${local.api_gateway_4 ? 1 : 0}"
  api_gateway_4_name           = "${local.lambda_4_name_computed}"
  api_gateway_4_path           = "${lookup(local.lambda_4, "http_path", local.lambda_4_name_computed)}"
  api_gateway_4_method         = "${upper(lookup(local.lambda_4, "http_method", "get"))}"
  api_gateway_4_stage          = "${local.stage}"
  api_gateway_4_metrics        = "${lookup(local.lambda_4, "http_metrics", "") != ""}"
  api_gateway_4_logging        = "${lookup(local.lambda_4, "http_logging", "") != ""}"
  api_gateway_4_logging_level  = "${local.api_gateway_4_logging ? "INFO" : "OFF"}"
  api_gateway_4_regional_count = "${local.lambda_4_same_region ? 0 : 1}"
  api_gateway_4_global_count   = "${local.lambda_4_same_region ? 1 : 0}"

  api_gateway_4_authorizer                  = "${lookup(local.lambda_4, "http_authorizer", "")}"
  api_gateway_4_authorizer_count            = "${local.api_gateway_4_authorizer != "" ? 1 : 0}"
  api_gateway_4_authorization               = "${local.api_gateway_4_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_4_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_4_authorizer}"
  api_gateway_4_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_4_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_4_authorizer_full_name}"
  api_gateway_4_authorizer_uri              = "arn:aws:apigateway:${local.lambda_4_region}:lambda:path/2015-03-31/functions/${local.api_gateway_4_authorizer_lambda_arn}/invocations"
  api_gateway_4_authorizer_policy_arn       = "${lookup(local.lambda_4, "http_authorizer_policy_arn", "")}"
  api_gateway_4_authorizer_policy_arn_count = "${local.api_gateway_4_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_4       = "${lookup(local.lambda_4, "schedule", "" ) != "" || lookup(local.lambda_4, "schedule_rate", "") != ""}"
  cloudwatch_4_count = "${local.cloudwatch_4 ? 1 : 0}"
  cloudwatch_4_name  = "${local.lambda_4_name_computed}"
  cloudwatch_4_rate  = "${lookup(local.lambda_4, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_4_bucket      = "${lookup(local.lambda_4, "s3_bucket", "")}"
  s3_4_bucket_arn  = "arn:aws:s3:::${local.s3_4_bucket}"
  s3_4_count       = "${local.s3_4_bucket != "" ? 1 : 0}"
  s3_4_prefix      = "${lookup(local.lambda_4, "s3_prefix", "")}"
  s3_4_suffix      = "${lookup(local.lambda_4, "s3_suffix", "")}"
  s3_4_events      = "${lookup(local.lambda_4, "s3_events", local.default_s3_events)}"
  s3_4_events_list = "${split(" ", local.s3_4_events)}"

  // Cloudwatch Event
  cloudwatch_event_4         = "${local.cloudwatch_event_4_pattern != ""}"
  cloudwatch_event_4_count   = "${local.cloudwatch_event_4 ? 1 : 0}"
  cloudwatch_event_4_name    = "${local.lambda_4_name_computed}"
  cloudwatch_event_4_pattern = "${lookup(local.lambda_4, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_5
locals {
  lambda_5 = "${local.functions[5]}"

  // Vars
  lambda_5_file         = "${lookup(local.lambda_5, "file", "")}"
  lambda_5_count        = "${local.lambda_5_file != "" ? 1 : 0}"
  lambda_5_vendor_cmd   = "${lookup(local.lambda_5, "vendor_cmd", "")}"
  lambda_5_test_cmd     = "${lookup(local.lambda_5, "test_cmd", "")}"
  lambda_5_timeout      = "${lookup(local.lambda_5, "timeout", "5")}"
  lambda_5_name         = "${lookup(local.lambda_5, "name", "")}"
  lambda_5_runtime      = "${lookup(local.lambda_5, "runtime", "")}"
  lambda_5_handler      = "${lookup(local.lambda_5, "handler", "")}"
  lambda_5_rebuild      = "${lookup(local.lambda_5, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_5_role_arn     = "${lookup(local.lambda_5, "role_arn", "")}"
  lambda_5_dir          = "${dirname(local.lambda_5_file)}"
  lambda_5_arn          = "arn:aws:lambda:${local.lambda_5_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_5_name_computed}"
  lambda_5_file_replace = "${replace(replace(replace(replace(replace(local.lambda_5_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_5_env_keys             = "${lookup(local.lambda_5, "env_keys", "AUTHOR")}"
  lambda_5_env_vals             = "${lookup(local.lambda_5, "env_vals", "rms1000watt")}"
  lambda_5_env_keys_list        = "${split(" ", local.lambda_5_env_keys)}"
  lambda_5_env_vals_list        = "${split(" ", local.lambda_5_env_vals)}"
  lambda_5_env_keys_list_length = "${length(local.lambda_5_env_keys_list)}"
  lambda_5_env_vals_list_length = "${length(local.lambda_5_env_vals_list)}"
  lambda_5_env                  = "${zipmap(local.lambda_5_env_keys_list, local.lambda_5_env_vals_list)}"

  lambda_5_region_in   = "${lookup(local.lambda_5, "region", "")}"
  lambda_5_region      = "${local.lambda_5_region_in != "" ? local.lambda_5_region_in  : data.aws_region.current.name}"
  lambda_5_same_region = "${local.lambda_5_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_5         = "${contains(split(".", local.lambda_5_file), "go")}"
  lambda_go_5_count   = "${local.lambda_go_5 ? 1 : 0}"
  lambda_go_5_name    = "${local.lambda_go_5 && local.lambda_5_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_5_name}" : "${local.service_name}-${local.stage}-${local.lambda_5_file_replace}-5" }" //"
  lambda_go_5_runtime = "${local.lambda_go_5 && local.lambda_5_runtime != "" ? local.lambda_5_runtime : "go1.x" }"
  lambda_go_5_handler = "${local.lambda_go_5 && local.lambda_5_handler != "" ? local.lambda_5_handler : local.lambda_go_5_name}"
  lambda_go_5_bin     = "${path.root}/bin/${local.lambda_go_5_name}"
  lambda_go_5_zip     = "${local.lambda_go_5 ? "${path.root}/.terraform/archive_files/${local.lambda_go_5_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_5             = "${contains(split(".", local.lambda_5_file), "py")}"
  lambda_py_5_count       = "${local.lambda_py_5 ? 1 : 0}"
  lambda_py_5_name        = "${local.lambda_py_5 && local.lambda_5_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_5_name}" : "${local.service_name}-${local.stage}-${local.lambda_5_file_replace}-5" }" //"
  lambda_py_5_runtime     = "${local.lambda_py_5 && local.lambda_5_runtime != "" ? local.lambda_5_runtime : "python3.6" }"
  lambda_py_5_handler     = "${local.lambda_py_5 && local.lambda_5_handler != "" ? local.lambda_5_handler : basename(replace(local.lambda_5_file, ".py", ".handler"))}"
  lambda_py_5_source_file = "${local.lambda_py_5 ? local.lambda_5_file : ""}"
  lambda_py_5_zip         = "${local.lambda_py_5 ? "${path.root}/.terraform/archive_files/${local.lambda_py_5_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_5             = "${contains(split(".", local.lambda_5_file), "js")}"
  lambda_js_5_count       = "${local.lambda_js_5 ? 1 : 0}"
  lambda_js_5_name        = "${local.lambda_js_5 && local.lambda_5_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_5_name}" : "${local.service_name}-${local.stage}-${local.lambda_5_file_replace}-5" }" //"
  lambda_js_5_runtime     = "${local.lambda_js_5 && local.lambda_5_runtime != "" ? local.lambda_5_runtime : "nodejs8.10" }"
  lambda_js_5_handler     = "${local.lambda_js_5 && local.lambda_5_handler != "" ? local.lambda_5_handler : basename(replace(local.lambda_5_file, ".js", ".handler"))}"
  lambda_js_5_source_file = "${local.lambda_js_5 ? local.lambda_5_file : ""}"
  lambda_js_5_zip         = "${local.lambda_js_5 ? "${path.root}/.terraform/archive_files/${local.lambda_js_5_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_5_name_computed = "${local.lambda_go_5 ? local.lambda_go_5_name : (local.lambda_py_5 ? local.lambda_py_5_name : (local.lambda_js_5 ? local.lambda_js_5_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_5                = "${lookup(local.lambda_5, "http", "" ) != "" || lookup(local.lambda_5, "http_path", "") != "" || lookup(local.lambda_5, "http_method", "") != "" || lookup(local.lambda_5, "http_authorizer", "") != "" || lookup(local.lambda_5, "http_stage", "") != ""}"
  api_gateway_5_count          = "${local.api_gateway_5 ? 1 : 0}"
  api_gateway_5_name           = "${local.lambda_5_name_computed}"
  api_gateway_5_path           = "${lookup(local.lambda_5, "http_path", local.lambda_5_name_computed)}"
  api_gateway_5_method         = "${upper(lookup(local.lambda_5, "http_method", "get"))}"
  api_gateway_5_stage          = "${local.stage}"
  api_gateway_5_metrics        = "${lookup(local.lambda_5, "http_metrics", "") != ""}"
  api_gateway_5_logging        = "${lookup(local.lambda_5, "http_logging", "") != ""}"
  api_gateway_5_logging_level  = "${local.api_gateway_5_logging ? "INFO" : "OFF"}"
  api_gateway_5_regional_count = "${local.lambda_5_same_region ? 0 : 1}"
  api_gateway_5_global_count   = "${local.lambda_5_same_region ? 1 : 0}"

  api_gateway_5_authorizer                  = "${lookup(local.lambda_5, "http_authorizer", "")}"
  api_gateway_5_authorizer_count            = "${local.api_gateway_5_authorizer != "" ? 1 : 0}"
  api_gateway_5_authorization               = "${local.api_gateway_5_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_5_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_5_authorizer}"
  api_gateway_5_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_5_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_5_authorizer_full_name}"
  api_gateway_5_authorizer_uri              = "arn:aws:apigateway:${local.lambda_5_region}:lambda:path/2015-03-31/functions/${local.api_gateway_5_authorizer_lambda_arn}/invocations"
  api_gateway_5_authorizer_policy_arn       = "${lookup(local.lambda_5, "http_authorizer_policy_arn", "")}"
  api_gateway_5_authorizer_policy_arn_count = "${local.api_gateway_5_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_5       = "${lookup(local.lambda_5, "schedule", "" ) != "" || lookup(local.lambda_5, "schedule_rate", "") != ""}"
  cloudwatch_5_count = "${local.cloudwatch_5 ? 1 : 0}"
  cloudwatch_5_name  = "${local.lambda_5_name_computed}"
  cloudwatch_5_rate  = "${lookup(local.lambda_5, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_5_bucket      = "${lookup(local.lambda_5, "s3_bucket", "")}"
  s3_5_bucket_arn  = "arn:aws:s3:::${local.s3_5_bucket}"
  s3_5_count       = "${local.s3_5_bucket != "" ? 1 : 0}"
  s3_5_prefix      = "${lookup(local.lambda_5, "s3_prefix", "")}"
  s3_5_suffix      = "${lookup(local.lambda_5, "s3_suffix", "")}"
  s3_5_events      = "${lookup(local.lambda_5, "s3_events", local.default_s3_events)}"
  s3_5_events_list = "${split(" ", local.s3_5_events)}"

  // Cloudwatch Event
  cloudwatch_event_5         = "${local.cloudwatch_event_5_pattern != ""}"
  cloudwatch_event_5_count   = "${local.cloudwatch_event_5 ? 1 : 0}"
  cloudwatch_event_5_name    = "${local.lambda_5_name_computed}"
  cloudwatch_event_5_pattern = "${lookup(local.lambda_5, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_6
locals {
  lambda_6 = "${local.functions[6]}"

  // Vars
  lambda_6_file         = "${lookup(local.lambda_6, "file", "")}"
  lambda_6_count        = "${local.lambda_6_file != "" ? 1 : 0}"
  lambda_6_vendor_cmd   = "${lookup(local.lambda_6, "vendor_cmd", "")}"
  lambda_6_test_cmd     = "${lookup(local.lambda_6, "test_cmd", "")}"
  lambda_6_timeout      = "${lookup(local.lambda_6, "timeout", "5")}"
  lambda_6_name         = "${lookup(local.lambda_6, "name", "")}"
  lambda_6_runtime      = "${lookup(local.lambda_6, "runtime", "")}"
  lambda_6_handler      = "${lookup(local.lambda_6, "handler", "")}"
  lambda_6_rebuild      = "${lookup(local.lambda_6, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_6_role_arn     = "${lookup(local.lambda_6, "role_arn", "")}"
  lambda_6_dir          = "${dirname(local.lambda_6_file)}"
  lambda_6_arn          = "arn:aws:lambda:${local.lambda_6_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_6_name_computed}"
  lambda_6_file_replace = "${replace(replace(replace(replace(replace(local.lambda_6_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_6_env_keys             = "${lookup(local.lambda_6, "env_keys", "AUTHOR")}"
  lambda_6_env_vals             = "${lookup(local.lambda_6, "env_vals", "rms1000watt")}"
  lambda_6_env_keys_list        = "${split(" ", local.lambda_6_env_keys)}"
  lambda_6_env_vals_list        = "${split(" ", local.lambda_6_env_vals)}"
  lambda_6_env_keys_list_length = "${length(local.lambda_6_env_keys_list)}"
  lambda_6_env_vals_list_length = "${length(local.lambda_6_env_vals_list)}"
  lambda_6_env                  = "${zipmap(local.lambda_6_env_keys_list, local.lambda_6_env_vals_list)}"

  lambda_6_region_in   = "${lookup(local.lambda_6, "region", "")}"
  lambda_6_region      = "${local.lambda_6_region_in != "" ? local.lambda_6_region_in  : data.aws_region.current.name}"
  lambda_6_same_region = "${local.lambda_6_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_6         = "${contains(split(".", local.lambda_6_file), "go")}"
  lambda_go_6_count   = "${local.lambda_go_6 ? 1 : 0}"
  lambda_go_6_name    = "${local.lambda_go_6 && local.lambda_6_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_6_name}" : "${local.service_name}-${local.stage}-${local.lambda_6_file_replace}-6" }" //"
  lambda_go_6_runtime = "${local.lambda_go_6 && local.lambda_6_runtime != "" ? local.lambda_6_runtime : "go1.x" }"
  lambda_go_6_handler = "${local.lambda_go_6 && local.lambda_6_handler != "" ? local.lambda_6_handler : local.lambda_go_6_name}"
  lambda_go_6_bin     = "${path.root}/bin/${local.lambda_go_6_name}"
  lambda_go_6_zip     = "${local.lambda_go_6 ? "${path.root}/.terraform/archive_files/${local.lambda_go_6_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_6             = "${contains(split(".", local.lambda_6_file), "py")}"
  lambda_py_6_count       = "${local.lambda_py_6 ? 1 : 0}"
  lambda_py_6_name        = "${local.lambda_py_6 && local.lambda_6_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_6_name}" : "${local.service_name}-${local.stage}-${local.lambda_6_file_replace}-6" }" //"
  lambda_py_6_runtime     = "${local.lambda_py_6 && local.lambda_6_runtime != "" ? local.lambda_6_runtime : "python3.6" }"
  lambda_py_6_handler     = "${local.lambda_py_6 && local.lambda_6_handler != "" ? local.lambda_6_handler : basename(replace(local.lambda_6_file, ".py", ".handler"))}"
  lambda_py_6_source_file = "${local.lambda_py_6 ? local.lambda_6_file : ""}"
  lambda_py_6_zip         = "${local.lambda_py_6 ? "${path.root}/.terraform/archive_files/${local.lambda_py_6_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_6             = "${contains(split(".", local.lambda_6_file), "js")}"
  lambda_js_6_count       = "${local.lambda_js_6 ? 1 : 0}"
  lambda_js_6_name        = "${local.lambda_js_6 && local.lambda_6_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_6_name}" : "${local.service_name}-${local.stage}-${local.lambda_6_file_replace}-6" }" //"
  lambda_js_6_runtime     = "${local.lambda_js_6 && local.lambda_6_runtime != "" ? local.lambda_6_runtime : "nodejs8.10" }"
  lambda_js_6_handler     = "${local.lambda_js_6 && local.lambda_6_handler != "" ? local.lambda_6_handler : basename(replace(local.lambda_6_file, ".js", ".handler"))}"
  lambda_js_6_source_file = "${local.lambda_js_6 ? local.lambda_6_file : ""}"
  lambda_js_6_zip         = "${local.lambda_js_6 ? "${path.root}/.terraform/archive_files/${local.lambda_js_6_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_6_name_computed = "${local.lambda_go_6 ? local.lambda_go_6_name : (local.lambda_py_6 ? local.lambda_py_6_name : (local.lambda_js_6 ? local.lambda_js_6_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_6                = "${lookup(local.lambda_6, "http", "" ) != "" || lookup(local.lambda_6, "http_path", "") != "" || lookup(local.lambda_6, "http_method", "") != "" || lookup(local.lambda_6, "http_authorizer", "") != "" || lookup(local.lambda_6, "http_stage", "") != ""}"
  api_gateway_6_count          = "${local.api_gateway_6 ? 1 : 0}"
  api_gateway_6_name           = "${local.lambda_6_name_computed}"
  api_gateway_6_path           = "${lookup(local.lambda_6, "http_path", local.lambda_6_name_computed)}"
  api_gateway_6_method         = "${upper(lookup(local.lambda_6, "http_method", "get"))}"
  api_gateway_6_stage          = "${local.stage}"
  api_gateway_6_metrics        = "${lookup(local.lambda_6, "http_metrics", "") != ""}"
  api_gateway_6_logging        = "${lookup(local.lambda_6, "http_logging", "") != ""}"
  api_gateway_6_logging_level  = "${local.api_gateway_6_logging ? "INFO" : "OFF"}"
  api_gateway_6_regional_count = "${local.lambda_6_same_region ? 0 : 1}"
  api_gateway_6_global_count   = "${local.lambda_6_same_region ? 1 : 0}"

  api_gateway_6_authorizer                  = "${lookup(local.lambda_6, "http_authorizer", "")}"
  api_gateway_6_authorizer_count            = "${local.api_gateway_6_authorizer != "" ? 1 : 0}"
  api_gateway_6_authorization               = "${local.api_gateway_6_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_6_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_6_authorizer}"
  api_gateway_6_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_6_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_6_authorizer_full_name}"
  api_gateway_6_authorizer_uri              = "arn:aws:apigateway:${local.lambda_6_region}:lambda:path/2015-03-31/functions/${local.api_gateway_6_authorizer_lambda_arn}/invocations"
  api_gateway_6_authorizer_policy_arn       = "${lookup(local.lambda_6, "http_authorizer_policy_arn", "")}"
  api_gateway_6_authorizer_policy_arn_count = "${local.api_gateway_6_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_6       = "${lookup(local.lambda_6, "schedule", "" ) != "" || lookup(local.lambda_6, "schedule_rate", "") != ""}"
  cloudwatch_6_count = "${local.cloudwatch_6 ? 1 : 0}"
  cloudwatch_6_name  = "${local.lambda_6_name_computed}"
  cloudwatch_6_rate  = "${lookup(local.lambda_6, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_6_bucket      = "${lookup(local.lambda_6, "s3_bucket", "")}"
  s3_6_bucket_arn  = "arn:aws:s3:::${local.s3_6_bucket}"
  s3_6_count       = "${local.s3_6_bucket != "" ? 1 : 0}"
  s3_6_prefix      = "${lookup(local.lambda_6, "s3_prefix", "")}"
  s3_6_suffix      = "${lookup(local.lambda_6, "s3_suffix", "")}"
  s3_6_events      = "${lookup(local.lambda_6, "s3_events", local.default_s3_events)}"
  s3_6_events_list = "${split(" ", local.s3_6_events)}"

  // Cloudwatch Event
  cloudwatch_event_6         = "${local.cloudwatch_event_6_pattern != ""}"
  cloudwatch_event_6_count   = "${local.cloudwatch_event_6 ? 1 : 0}"
  cloudwatch_event_6_name    = "${local.lambda_6_name_computed}"
  cloudwatch_event_6_pattern = "${lookup(local.lambda_6, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_7
locals {
  lambda_7 = "${local.functions[7]}"

  // Vars
  lambda_7_file         = "${lookup(local.lambda_7, "file", "")}"
  lambda_7_count        = "${local.lambda_7_file != "" ? 1 : 0}"
  lambda_7_vendor_cmd   = "${lookup(local.lambda_7, "vendor_cmd", "")}"
  lambda_7_test_cmd     = "${lookup(local.lambda_7, "test_cmd", "")}"
  lambda_7_timeout      = "${lookup(local.lambda_7, "timeout", "5")}"
  lambda_7_name         = "${lookup(local.lambda_7, "name", "")}"
  lambda_7_runtime      = "${lookup(local.lambda_7, "runtime", "")}"
  lambda_7_handler      = "${lookup(local.lambda_7, "handler", "")}"
  lambda_7_rebuild      = "${lookup(local.lambda_7, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_7_role_arn     = "${lookup(local.lambda_7, "role_arn", "")}"
  lambda_7_dir          = "${dirname(local.lambda_7_file)}"
  lambda_7_arn          = "arn:aws:lambda:${local.lambda_7_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_7_name_computed}"
  lambda_7_file_replace = "${replace(replace(replace(replace(replace(local.lambda_7_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_7_env_keys             = "${lookup(local.lambda_7, "env_keys", "AUTHOR")}"
  lambda_7_env_vals             = "${lookup(local.lambda_7, "env_vals", "rms1000watt")}"
  lambda_7_env_keys_list        = "${split(" ", local.lambda_7_env_keys)}"
  lambda_7_env_vals_list        = "${split(" ", local.lambda_7_env_vals)}"
  lambda_7_env_keys_list_length = "${length(local.lambda_7_env_keys_list)}"
  lambda_7_env_vals_list_length = "${length(local.lambda_7_env_vals_list)}"
  lambda_7_env                  = "${zipmap(local.lambda_7_env_keys_list, local.lambda_7_env_vals_list)}"

  lambda_7_region_in   = "${lookup(local.lambda_7, "region", "")}"
  lambda_7_region      = "${local.lambda_7_region_in != "" ? local.lambda_7_region_in  : data.aws_region.current.name}"
  lambda_7_same_region = "${local.lambda_7_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_7         = "${contains(split(".", local.lambda_7_file), "go")}"
  lambda_go_7_count   = "${local.lambda_go_7 ? 1 : 0}"
  lambda_go_7_name    = "${local.lambda_go_7 && local.lambda_7_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_7_name}" : "${local.service_name}-${local.stage}-${local.lambda_7_file_replace}-7" }" //"
  lambda_go_7_runtime = "${local.lambda_go_7 && local.lambda_7_runtime != "" ? local.lambda_7_runtime : "go1.x" }"
  lambda_go_7_handler = "${local.lambda_go_7 && local.lambda_7_handler != "" ? local.lambda_7_handler : local.lambda_go_7_name}"
  lambda_go_7_bin     = "${path.root}/bin/${local.lambda_go_7_name}"
  lambda_go_7_zip     = "${local.lambda_go_7 ? "${path.root}/.terraform/archive_files/${local.lambda_go_7_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_7             = "${contains(split(".", local.lambda_7_file), "py")}"
  lambda_py_7_count       = "${local.lambda_py_7 ? 1 : 0}"
  lambda_py_7_name        = "${local.lambda_py_7 && local.lambda_7_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_7_name}" : "${local.service_name}-${local.stage}-${local.lambda_7_file_replace}-7" }" //"
  lambda_py_7_runtime     = "${local.lambda_py_7 && local.lambda_7_runtime != "" ? local.lambda_7_runtime : "python3.6" }"
  lambda_py_7_handler     = "${local.lambda_py_7 && local.lambda_7_handler != "" ? local.lambda_7_handler : basename(replace(local.lambda_7_file, ".py", ".handler"))}"
  lambda_py_7_source_file = "${local.lambda_py_7 ? local.lambda_7_file : ""}"
  lambda_py_7_zip         = "${local.lambda_py_7 ? "${path.root}/.terraform/archive_files/${local.lambda_py_7_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_7             = "${contains(split(".", local.lambda_7_file), "js")}"
  lambda_js_7_count       = "${local.lambda_js_7 ? 1 : 0}"
  lambda_js_7_name        = "${local.lambda_js_7 && local.lambda_7_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_7_name}" : "${local.service_name}-${local.stage}-${local.lambda_7_file_replace}-7" }" //"
  lambda_js_7_runtime     = "${local.lambda_js_7 && local.lambda_7_runtime != "" ? local.lambda_7_runtime : "nodejs8.10" }"
  lambda_js_7_handler     = "${local.lambda_js_7 && local.lambda_7_handler != "" ? local.lambda_7_handler : basename(replace(local.lambda_7_file, ".js", ".handler"))}"
  lambda_js_7_source_file = "${local.lambda_js_7 ? local.lambda_7_file : ""}"
  lambda_js_7_zip         = "${local.lambda_js_7 ? "${path.root}/.terraform/archive_files/${local.lambda_js_7_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_7_name_computed = "${local.lambda_go_7 ? local.lambda_go_7_name : (local.lambda_py_7 ? local.lambda_py_7_name : (local.lambda_js_7 ? local.lambda_js_7_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_7                = "${lookup(local.lambda_7, "http", "" ) != "" || lookup(local.lambda_7, "http_path", "") != "" || lookup(local.lambda_7, "http_method", "") != "" || lookup(local.lambda_7, "http_authorizer", "") != "" || lookup(local.lambda_7, "http_stage", "") != ""}"
  api_gateway_7_count          = "${local.api_gateway_7 ? 1 : 0}"
  api_gateway_7_name           = "${local.lambda_7_name_computed}"
  api_gateway_7_path           = "${lookup(local.lambda_7, "http_path", local.lambda_7_name_computed)}"
  api_gateway_7_method         = "${upper(lookup(local.lambda_7, "http_method", "get"))}"
  api_gateway_7_stage          = "${local.stage}"
  api_gateway_7_metrics        = "${lookup(local.lambda_7, "http_metrics", "") != ""}"
  api_gateway_7_logging        = "${lookup(local.lambda_7, "http_logging", "") != ""}"
  api_gateway_7_logging_level  = "${local.api_gateway_7_logging ? "INFO" : "OFF"}"
  api_gateway_7_regional_count = "${local.lambda_7_same_region ? 0 : 1}"
  api_gateway_7_global_count   = "${local.lambda_7_same_region ? 1 : 0}"

  api_gateway_7_authorizer                  = "${lookup(local.lambda_7, "http_authorizer", "")}"
  api_gateway_7_authorizer_count            = "${local.api_gateway_7_authorizer != "" ? 1 : 0}"
  api_gateway_7_authorization               = "${local.api_gateway_7_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_7_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_7_authorizer}"
  api_gateway_7_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_7_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_7_authorizer_full_name}"
  api_gateway_7_authorizer_uri              = "arn:aws:apigateway:${local.lambda_7_region}:lambda:path/2015-03-31/functions/${local.api_gateway_7_authorizer_lambda_arn}/invocations"
  api_gateway_7_authorizer_policy_arn       = "${lookup(local.lambda_7, "http_authorizer_policy_arn", "")}"
  api_gateway_7_authorizer_policy_arn_count = "${local.api_gateway_7_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_7       = "${lookup(local.lambda_7, "schedule", "" ) != "" || lookup(local.lambda_7, "schedule_rate", "") != ""}"
  cloudwatch_7_count = "${local.cloudwatch_7 ? 1 : 0}"
  cloudwatch_7_name  = "${local.lambda_7_name_computed}"
  cloudwatch_7_rate  = "${lookup(local.lambda_7, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_7_bucket      = "${lookup(local.lambda_7, "s3_bucket", "")}"
  s3_7_bucket_arn  = "arn:aws:s3:::${local.s3_7_bucket}"
  s3_7_count       = "${local.s3_7_bucket != "" ? 1 : 0}"
  s3_7_prefix      = "${lookup(local.lambda_7, "s3_prefix", "")}"
  s3_7_suffix      = "${lookup(local.lambda_7, "s3_suffix", "")}"
  s3_7_events      = "${lookup(local.lambda_7, "s3_events", local.default_s3_events)}"
  s3_7_events_list = "${split(" ", local.s3_7_events)}"

  // Cloudwatch Event
  cloudwatch_event_7         = "${local.cloudwatch_event_7_pattern != ""}"
  cloudwatch_event_7_count   = "${local.cloudwatch_event_7 ? 1 : 0}"
  cloudwatch_event_7_name    = "${local.lambda_7_name_computed}"
  cloudwatch_event_7_pattern = "${lookup(local.lambda_7, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_8
locals {
  lambda_8 = "${local.functions[8]}"

  // Vars
  lambda_8_file         = "${lookup(local.lambda_8, "file", "")}"
  lambda_8_count        = "${local.lambda_8_file != "" ? 1 : 0}"
  lambda_8_vendor_cmd   = "${lookup(local.lambda_8, "vendor_cmd", "")}"
  lambda_8_test_cmd     = "${lookup(local.lambda_8, "test_cmd", "")}"
  lambda_8_timeout      = "${lookup(local.lambda_8, "timeout", "5")}"
  lambda_8_name         = "${lookup(local.lambda_8, "name", "")}"
  lambda_8_runtime      = "${lookup(local.lambda_8, "runtime", "")}"
  lambda_8_handler      = "${lookup(local.lambda_8, "handler", "")}"
  lambda_8_rebuild      = "${lookup(local.lambda_8, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_8_role_arn     = "${lookup(local.lambda_8, "role_arn", "")}"
  lambda_8_dir          = "${dirname(local.lambda_8_file)}"
  lambda_8_arn          = "arn:aws:lambda:${local.lambda_8_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_8_name_computed}"
  lambda_8_file_replace = "${replace(replace(replace(replace(replace(local.lambda_8_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_8_env_keys             = "${lookup(local.lambda_8, "env_keys", "AUTHOR")}"
  lambda_8_env_vals             = "${lookup(local.lambda_8, "env_vals", "rms1000watt")}"
  lambda_8_env_keys_list        = "${split(" ", local.lambda_8_env_keys)}"
  lambda_8_env_vals_list        = "${split(" ", local.lambda_8_env_vals)}"
  lambda_8_env_keys_list_length = "${length(local.lambda_8_env_keys_list)}"
  lambda_8_env_vals_list_length = "${length(local.lambda_8_env_vals_list)}"
  lambda_8_env                  = "${zipmap(local.lambda_8_env_keys_list, local.lambda_8_env_vals_list)}"

  lambda_8_region_in   = "${lookup(local.lambda_8, "region", "")}"
  lambda_8_region      = "${local.lambda_8_region_in != "" ? local.lambda_8_region_in  : data.aws_region.current.name}"
  lambda_8_same_region = "${local.lambda_8_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_8         = "${contains(split(".", local.lambda_8_file), "go")}"
  lambda_go_8_count   = "${local.lambda_go_8 ? 1 : 0}"
  lambda_go_8_name    = "${local.lambda_go_8 && local.lambda_8_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_8_name}" : "${local.service_name}-${local.stage}-${local.lambda_8_file_replace}-8" }" //"
  lambda_go_8_runtime = "${local.lambda_go_8 && local.lambda_8_runtime != "" ? local.lambda_8_runtime : "go1.x" }"
  lambda_go_8_handler = "${local.lambda_go_8 && local.lambda_8_handler != "" ? local.lambda_8_handler : local.lambda_go_8_name}"
  lambda_go_8_bin     = "${path.root}/bin/${local.lambda_go_8_name}"
  lambda_go_8_zip     = "${local.lambda_go_8 ? "${path.root}/.terraform/archive_files/${local.lambda_go_8_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_8             = "${contains(split(".", local.lambda_8_file), "py")}"
  lambda_py_8_count       = "${local.lambda_py_8 ? 1 : 0}"
  lambda_py_8_name        = "${local.lambda_py_8 && local.lambda_8_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_8_name}" : "${local.service_name}-${local.stage}-${local.lambda_8_file_replace}-8" }" //"
  lambda_py_8_runtime     = "${local.lambda_py_8 && local.lambda_8_runtime != "" ? local.lambda_8_runtime : "python3.6" }"
  lambda_py_8_handler     = "${local.lambda_py_8 && local.lambda_8_handler != "" ? local.lambda_8_handler : basename(replace(local.lambda_8_file, ".py", ".handler"))}"
  lambda_py_8_source_file = "${local.lambda_py_8 ? local.lambda_8_file : ""}"
  lambda_py_8_zip         = "${local.lambda_py_8 ? "${path.root}/.terraform/archive_files/${local.lambda_py_8_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_8             = "${contains(split(".", local.lambda_8_file), "js")}"
  lambda_js_8_count       = "${local.lambda_js_8 ? 1 : 0}"
  lambda_js_8_name        = "${local.lambda_js_8 && local.lambda_8_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_8_name}" : "${local.service_name}-${local.stage}-${local.lambda_8_file_replace}-8" }" //"
  lambda_js_8_runtime     = "${local.lambda_js_8 && local.lambda_8_runtime != "" ? local.lambda_8_runtime : "nodejs8.10" }"
  lambda_js_8_handler     = "${local.lambda_js_8 && local.lambda_8_handler != "" ? local.lambda_8_handler : basename(replace(local.lambda_8_file, ".js", ".handler"))}"
  lambda_js_8_source_file = "${local.lambda_js_8 ? local.lambda_8_file : ""}"
  lambda_js_8_zip         = "${local.lambda_js_8 ? "${path.root}/.terraform/archive_files/${local.lambda_js_8_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_8_name_computed = "${local.lambda_go_8 ? local.lambda_go_8_name : (local.lambda_py_8 ? local.lambda_py_8_name : (local.lambda_js_8 ? local.lambda_js_8_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_8                = "${lookup(local.lambda_8, "http", "" ) != "" || lookup(local.lambda_8, "http_path", "") != "" || lookup(local.lambda_8, "http_method", "") != "" || lookup(local.lambda_8, "http_authorizer", "") != "" || lookup(local.lambda_8, "http_stage", "") != ""}"
  api_gateway_8_count          = "${local.api_gateway_8 ? 1 : 0}"
  api_gateway_8_name           = "${local.lambda_8_name_computed}"
  api_gateway_8_path           = "${lookup(local.lambda_8, "http_path", local.lambda_8_name_computed)}"
  api_gateway_8_method         = "${upper(lookup(local.lambda_8, "http_method", "get"))}"
  api_gateway_8_stage          = "${local.stage}"
  api_gateway_8_metrics        = "${lookup(local.lambda_8, "http_metrics", "") != ""}"
  api_gateway_8_logging        = "${lookup(local.lambda_8, "http_logging", "") != ""}"
  api_gateway_8_logging_level  = "${local.api_gateway_8_logging ? "INFO" : "OFF"}"
  api_gateway_8_regional_count = "${local.lambda_8_same_region ? 0 : 1}"
  api_gateway_8_global_count   = "${local.lambda_8_same_region ? 1 : 0}"

  api_gateway_8_authorizer                  = "${lookup(local.lambda_8, "http_authorizer", "")}"
  api_gateway_8_authorizer_count            = "${local.api_gateway_8_authorizer != "" ? 1 : 0}"
  api_gateway_8_authorization               = "${local.api_gateway_8_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_8_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_8_authorizer}"
  api_gateway_8_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_8_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_8_authorizer_full_name}"
  api_gateway_8_authorizer_uri              = "arn:aws:apigateway:${local.lambda_8_region}:lambda:path/2015-03-31/functions/${local.api_gateway_8_authorizer_lambda_arn}/invocations"
  api_gateway_8_authorizer_policy_arn       = "${lookup(local.lambda_8, "http_authorizer_policy_arn", "")}"
  api_gateway_8_authorizer_policy_arn_count = "${local.api_gateway_8_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_8       = "${lookup(local.lambda_8, "schedule", "" ) != "" || lookup(local.lambda_8, "schedule_rate", "") != ""}"
  cloudwatch_8_count = "${local.cloudwatch_8 ? 1 : 0}"
  cloudwatch_8_name  = "${local.lambda_8_name_computed}"
  cloudwatch_8_rate  = "${lookup(local.lambda_8, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_8_bucket      = "${lookup(local.lambda_8, "s3_bucket", "")}"
  s3_8_bucket_arn  = "arn:aws:s3:::${local.s3_8_bucket}"
  s3_8_count       = "${local.s3_8_bucket != "" ? 1 : 0}"
  s3_8_prefix      = "${lookup(local.lambda_8, "s3_prefix", "")}"
  s3_8_suffix      = "${lookup(local.lambda_8, "s3_suffix", "")}"
  s3_8_events      = "${lookup(local.lambda_8, "s3_events", local.default_s3_events)}"
  s3_8_events_list = "${split(" ", local.s3_8_events)}"

  // Cloudwatch Event
  cloudwatch_event_8         = "${local.cloudwatch_event_8_pattern != ""}"
  cloudwatch_event_8_count   = "${local.cloudwatch_event_8 ? 1 : 0}"
  cloudwatch_event_8_name    = "${local.lambda_8_name_computed}"
  cloudwatch_event_8_pattern = "${lookup(local.lambda_8, "cloudwatch_event_pattern", "")}"
}

// locals for lambda_9
locals {
  lambda_9 = "${local.functions[9]}"

  // Vars
  lambda_9_file         = "${lookup(local.lambda_9, "file", "")}"
  lambda_9_count        = "${local.lambda_9_file != "" ? 1 : 0}"
  lambda_9_vendor_cmd   = "${lookup(local.lambda_9, "vendor_cmd", "")}"
  lambda_9_test_cmd     = "${lookup(local.lambda_9, "test_cmd", "")}"
  lambda_9_timeout      = "${lookup(local.lambda_9, "timeout", "5")}"
  lambda_9_name         = "${lookup(local.lambda_9, "name", "")}"
  lambda_9_runtime      = "${lookup(local.lambda_9, "runtime", "")}"
  lambda_9_handler      = "${lookup(local.lambda_9, "handler", "")}"
  lambda_9_rebuild      = "${lookup(local.lambda_9, "rebuild", local.default_rebuild) != local.default_rebuild}"
  lambda_9_role_arn     = "${lookup(local.lambda_9, "role_arn", "")}"
  lambda_9_dir          = "${dirname(local.lambda_9_file)}"
  lambda_9_arn          = "arn:aws:lambda:${local.lambda_9_region}:${data.aws_caller_identity.current.account_id}:function:${local.lambda_9_name_computed}"
  lambda_9_file_replace = "${replace(replace(replace(replace(replace(local.lambda_9_file, ".go", ""), ".py", ""), ".js", ""), "/", "-"), "..", "-")}"

  lambda_9_env_keys             = "${lookup(local.lambda_9, "env_keys", "AUTHOR")}"
  lambda_9_env_vals             = "${lookup(local.lambda_9, "env_vals", "rms1000watt")}"
  lambda_9_env_keys_list        = "${split(" ", local.lambda_9_env_keys)}"
  lambda_9_env_vals_list        = "${split(" ", local.lambda_9_env_vals)}"
  lambda_9_env_keys_list_length = "${length(local.lambda_9_env_keys_list)}"
  lambda_9_env_vals_list_length = "${length(local.lambda_9_env_vals_list)}"
  lambda_9_env                  = "${zipmap(local.lambda_9_env_keys_list, local.lambda_9_env_vals_list)}"

  lambda_9_region_in   = "${lookup(local.lambda_9, "region", "")}"
  lambda_9_region      = "${local.lambda_9_region_in != "" ? local.lambda_9_region_in  : data.aws_region.current.name}"
  lambda_9_same_region = "${local.lambda_9_region == data.aws_region.current.name}"

  // Lambda for Golang
  lambda_go_9         = "${contains(split(".", local.lambda_9_file), "go")}"
  lambda_go_9_count   = "${local.lambda_go_9 ? 1 : 0}"
  lambda_go_9_name    = "${local.lambda_go_9 && local.lambda_9_name    != "" ? "${local.service_name}-${local.stage}-${local.lambda_9_name}" : "${local.service_name}-${local.stage}-${local.lambda_9_file_replace}-9" }" //"
  lambda_go_9_runtime = "${local.lambda_go_9 && local.lambda_9_runtime != "" ? local.lambda_9_runtime : "go1.x" }"
  lambda_go_9_handler = "${local.lambda_go_9 && local.lambda_9_handler != "" ? local.lambda_9_handler : local.lambda_go_9_name}"
  lambda_go_9_bin     = "${path.root}/bin/${local.lambda_go_9_name}"
  lambda_go_9_zip     = "${local.lambda_go_9 ? "${path.root}/.terraform/archive_files/${local.lambda_go_9_name}-lambda.zip" : ""}" //"

  // Lambda for Python
  lambda_py_9             = "${contains(split(".", local.lambda_9_file), "py")}"
  lambda_py_9_count       = "${local.lambda_py_9 ? 1 : 0}"
  lambda_py_9_name        = "${local.lambda_py_9 && local.lambda_9_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_9_name}" : "${local.service_name}-${local.stage}-${local.lambda_9_file_replace}-9" }" //"
  lambda_py_9_runtime     = "${local.lambda_py_9 && local.lambda_9_runtime != "" ? local.lambda_9_runtime : "python3.6" }"
  lambda_py_9_handler     = "${local.lambda_py_9 && local.lambda_9_handler != "" ? local.lambda_9_handler : basename(replace(local.lambda_9_file, ".py", ".handler"))}"
  lambda_py_9_source_file = "${local.lambda_py_9 ? local.lambda_9_file : ""}"
  lambda_py_9_zip         = "${local.lambda_py_9 ? "${path.root}/.terraform/archive_files/${local.lambda_py_9_name}-lambda.zip" : ""}" //"

  // Lambda for JS
  lambda_js_9             = "${contains(split(".", local.lambda_9_file), "js")}"
  lambda_js_9_count       = "${local.lambda_js_9 ? 1 : 0}"
  lambda_js_9_name        = "${local.lambda_js_9 && local.lambda_9_name != "" ? "${local.service_name}-${local.stage}-${local.lambda_9_name}" : "${local.service_name}-${local.stage}-${local.lambda_9_file_replace}-9" }" //"
  lambda_js_9_runtime     = "${local.lambda_js_9 && local.lambda_9_runtime != "" ? local.lambda_9_runtime : "nodejs8.10" }"
  lambda_js_9_handler     = "${local.lambda_js_9 && local.lambda_9_handler != "" ? local.lambda_9_handler : basename(replace(local.lambda_9_file, ".js", ".handler"))}"
  lambda_js_9_source_file = "${local.lambda_js_9 ? local.lambda_9_file : ""}"
  lambda_js_9_zip         = "${local.lambda_js_9 ? "${path.root}/.terraform/archive_files/${local.lambda_js_9_name}-lambda.zip" : ""}" //"

  // Lambda Generic
  lambda_9_name_computed = "${local.lambda_go_9 ? local.lambda_go_9_name : (local.lambda_py_9 ? local.lambda_py_9_name : (local.lambda_js_9 ? local.lambda_js_9_name : local.default_lambda_name))}"

  // API Gateway
  api_gateway_9                = "${lookup(local.lambda_9, "http", "" ) != "" || lookup(local.lambda_9, "http_path", "") != "" || lookup(local.lambda_9, "http_method", "") != "" || lookup(local.lambda_9, "http_authorizer", "") != "" || lookup(local.lambda_9, "http_stage", "") != ""}"
  api_gateway_9_count          = "${local.api_gateway_9 ? 1 : 0}"
  api_gateway_9_name           = "${local.lambda_9_name_computed}"
  api_gateway_9_path           = "${lookup(local.lambda_9, "http_path", local.lambda_9_name_computed)}"
  api_gateway_9_method         = "${upper(lookup(local.lambda_9, "http_method", "get"))}"
  api_gateway_9_stage          = "${local.stage}"
  api_gateway_9_metrics        = "${lookup(local.lambda_9, "http_metrics", "") != ""}"
  api_gateway_9_logging        = "${lookup(local.lambda_9, "http_logging", "") != ""}"
  api_gateway_9_logging_level  = "${local.api_gateway_9_logging ? "INFO" : "OFF"}"
  api_gateway_9_regional_count = "${local.lambda_9_same_region ? 0 : 1}"
  api_gateway_9_global_count   = "${local.lambda_9_same_region ? 1 : 0}"

  api_gateway_9_authorizer                  = "${lookup(local.lambda_9, "http_authorizer", "")}"
  api_gateway_9_authorizer_count            = "${local.api_gateway_9_authorizer != "" ? 1 : 0}"
  api_gateway_9_authorization               = "${local.api_gateway_9_authorizer != "" ? "CUSTOM" : "NONE"}"
  api_gateway_9_authorizer_full_name        = "${local.service_name}-${local.stage}-${local.api_gateway_9_authorizer}"
  api_gateway_9_authorizer_lambda_arn       = "arn:aws:lambda:${lookup(local.lambda_name_region, local.api_gateway_9_authorizer, "")}:${data.aws_caller_identity.current.account_id}:function:${local.api_gateway_9_authorizer_full_name}"
  api_gateway_9_authorizer_uri              = "arn:aws:apigateway:${local.lambda_9_region}:lambda:path/2015-03-31/functions/${local.api_gateway_9_authorizer_lambda_arn}/invocations"
  api_gateway_9_authorizer_policy_arn       = "${lookup(local.lambda_9, "http_authorizer_policy_arn", "")}"
  api_gateway_9_authorizer_policy_arn_count = "${local.api_gateway_9_authorizer_policy_arn != "" ? 1 : 0}"

  // Cloudwatch Schedule
  cloudwatch_9       = "${lookup(local.lambda_9, "schedule", "" ) != "" || lookup(local.lambda_9, "schedule_rate", "") != ""}"
  cloudwatch_9_count = "${local.cloudwatch_9 ? 1 : 0}"
  cloudwatch_9_name  = "${local.lambda_9_name_computed}"
  cloudwatch_9_rate  = "${lookup(local.lambda_9, "schedule_rate", "rate(1 hour)")}"

  // S3
  s3_9_bucket      = "${lookup(local.lambda_9, "s3_bucket", "")}"
  s3_9_bucket_arn  = "arn:aws:s3:::${local.s3_9_bucket}"
  s3_9_count       = "${local.s3_9_bucket != "" ? 1 : 0}"
  s3_9_prefix      = "${lookup(local.lambda_9, "s3_prefix", "")}"
  s3_9_suffix      = "${lookup(local.lambda_9, "s3_suffix", "")}"
  s3_9_events      = "${lookup(local.lambda_9, "s3_events", local.default_s3_events)}"
  s3_9_events_list = "${split(" ", local.s3_9_events)}"

  // Cloudwatch Event
  cloudwatch_event_9         = "${local.cloudwatch_event_9_pattern != ""}"
  cloudwatch_event_9_count   = "${local.cloudwatch_event_9 ? 1 : 0}"
  cloudwatch_event_9_name    = "${local.lambda_9_name_computed}"
  cloudwatch_event_9_pattern = "${lookup(local.lambda_9, "cloudwatch_event_pattern", "")}"
}

locals {
  lambda_name_region {
    "${local.lambda_0_name}" = "${local.lambda_0_region}",
    "${local.lambda_1_name}" = "${local.lambda_1_region}",
    "${local.lambda_2_name}" = "${local.lambda_2_region}",
    "${local.lambda_3_name}" = "${local.lambda_3_region}",
    "${local.lambda_4_name}" = "${local.lambda_4_region}",
    "${local.lambda_5_name}" = "${local.lambda_5_region}",
    "${local.lambda_6_name}" = "${local.lambda_6_region}",
    "${local.lambda_7_name}" = "${local.lambda_7_region}",
    "${local.lambda_8_name}" = "${local.lambda_8_region}",
    "${local.lambda_9_name}" = "${local.lambda_9_region}",
  }
}
