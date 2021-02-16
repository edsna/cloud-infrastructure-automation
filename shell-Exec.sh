# Fields
stack_name=$1
template=$2
parameters=$3
capabilities=CAPABILITY_NAMED_IAM
region=us-west-2


#Check parameters
if [ -z $stack_name ] || [ -z $template ] || [ -z $parameters ]
then
    echo
    echo 'Error:  Invalid parameters!!!'
    echo
    echo 'Usage:  update--stack <stack-name> <template_file> <param_file>'
    echo
    exit 1
fi


# Check template, params
aws cloudformation validate-template --template-body file://$template > /dev/null 2>&1

if [ $? -gt 0 ]
then
    #Print Err
    aws cloudformation validate-template --template-body file://$template
    exit 1
else
    echo
    echo "Your template $template is valid!!!"
fi


#Check Stack existence
aws cloudformation describe-stacks --stack-name $stack_name > /dev/null 2>&1
response=$?
if [ $response -eq 254 ]
then
    echo
    echo 'Success!'
    echo 'Creating stack...'
    cfn_cmd='create-stack'
elif [ $response -eq 0 ]
then
    echo
    echo 'Updating stack...'
    cfn_cmd='update-stack'
    echo 'test srv = ' [cfn_cmd]
else
    echo 'Ops!   Unknown exception caught!'
    echo 'Cause = ' [$response -eq 255]
    echo '...exiting!'
    exit 1
fi


##### execute aws command
aws cloudformation $cfn_cmd \
--stack-name $stack_name \
--template-body file://$template \
--parameters file://$parameters \
--region=$region \
--capabilities=$capabilities

if [ $? -eq 0 ]
then
    echo 'Operation completed successfully... check your AWS console for status.'
fi
echo
echo 'Complete!!!'
echo
