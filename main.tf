resource "aws_lambda_function" "lambda_function" {
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.s3_key}"
  function_name = "${var.function_name}"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "${var.handler}"
  runtime       = "${var.runtime}"
  timeout       = "${var.timeout}"

  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = ["${var.security_group_ids}"]
  }

  environment {
    variables = "${var.lambda_env}"
  }
}

resource "aws_sns_topic" "ami_auto_build" {
  name = "ami_auto_build"
}

resource "aws_lambda_permission" "with_sns" {
    statement_id = "AllowExecutionFromSNS"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.lambda_function.arn}"
    principal = "sns.amazonaws.com"
    source_arn = "${aws_sns_topic.ami_auto_build.arn}"
}