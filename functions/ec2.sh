# "ec2 ls"
function els {
    aws ec2 describe-instances --query "Reservations[].Instances[].[Tags[0].Value,InstanceId,InstanceType,State.Name,PublicDnsName]"
}

# "ec2 start"
function estart {
    instances=$(els)
    line=$(echo "$instances" | fgrep -n $1 | cut -f 1 -d :)
    line=$((line + 1))
    instance_line=$(echo $instances | sed -n "${line}p")
    instance_id=$(echo $instance_line | cut -f 2 -d '"')
    aws ec2 start-instances --instance-ids ${instance_id}
}

# "ec2 stop"
function estop {
    instances=$(els)
    line=$(echo "$instances" | fgrep -n $1 | cut -f 1 -d :)
    line=$((line + 1))
    instance_line=$(echo $instances | sed -n "${line}p")
    instance_id=$(echo $instance_line | cut -f 2 -d '"')
    aws ec2 stop-instances --instance-ids ${instance_id}
}

# "ssh to ec2 instance"
function essh {
    instances=$(els)
    line=$(echo "$instances" | fgrep -n $1 | cut -f 1 -d :)
    line=$((line + 4))
    instance_line=$(echo $instances | sed -n "${line}p")
    instance_id=$(echo $instance_line | cut -f 2 -d '"')
    ssh ${instance_id}
}
