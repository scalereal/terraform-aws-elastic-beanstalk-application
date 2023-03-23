data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["elasticbeanstalk.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "this" {
  name               = "eb_appversion_deletion_role"
  assume_role_policy = data.aws_iam_policy_document.this.json
}


resource "aws_iam_role_policy_attachment" "service_policy_attachment" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.eb_custom_service_policy.arn
}


resource "aws_iam_policy" "eb_custom_service_policy" {
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowCloudformationReadOperationsOnElasticBeanstalkStacks",
        "Effect" : "Allow",
        "Action" : [
          "cloudformation:DescribeStackResource",
          "cloudformation:DescribeStackResources",
          "cloudformation:DescribeStacks"
        ],
        "Resource" : [
          "arn:aws:cloudformation:*:*:stack/awseb-*",
          "arn:aws:cloudformation:*:*:stack/eb-*"
        ]
      },
      {
        "Sid" : "AllowOperations",
        "Effect" : "Allow",
        "Action" : [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeNotificationConfigurations",
          "autoscaling:DescribeScalingActivities",
          "autoscaling:PutNotificationConfiguration",
          "ec2:DescribeInstanceStatus",
          "ec2:AssociateAddress",
          "ec2:DescribeAddresses",
          "ec2:DescribeInstances",
          "ec2:DescribeSecurityGroups",
          "elasticloadbalancing:DescribeInstanceHealth",
          "elasticloadbalancing:DescribeLoadBalancers",
          "elasticloadbalancing:DescribeTargetHealth",
          "elasticloadbalancing:DescribeTargetGroups",
          "lambda:GetFunction",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl",
          "sns:Publish"
        ],
        "Resource" : [
          "*"
        ]
      },
      {
        "Sid" : "AllowOperationsOnHealthStreamingLogs",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogStream",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:DeleteLogGroup",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:log-group:/aws/elasticbeanstalk/*"
      }
    ]
  })
}
