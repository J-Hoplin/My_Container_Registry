import argparse,subprocess

parser = argparse.ArgumentParser(
    prog="Cent OS Docker SSH env",
)

parser.add_argument("-n",required=False,help="Docker Container Name | Not Required")
parser.add_argument ("-v",required=False,help="Docker mount local volume | Not Required")
parser.add_argument("-p",required=False,help="Docker port bind | Not Required")
parser.add_argument("-i",required=True,help="Docker Image Name | Required")

# Convert args to dictionary
args = vars(parser.parse_args())

command_dockerrun = "sudo docker run -d --privileged"
option_dockerrun = list()


# Option --name
option_dockerrun.append(f"--name {args['n']}") if args['n'] else False
# Option -v
option_dockerrun.append(f"-v {args['v']}:/root") if args['v'] else False
# Option -p
option_dockerrun.append(f"-p {args['p']}:22") if args['p'] else False
# Restart option
option_dockerrun.append("--restart=unless-stopped")
# Option i
option_dockerrun.append(f"{args['i']}")
# Starting command
option_dockerrun.append("/sbin/init")
command_dockerrun = f"{command_dockerrun} {' '.join(option_dockerrun)}"
command_initiate = f"docker exec {args['n']} entrypoint.sh"
subprocess.run(f"sudo {command_dockerrun} && {command_initiate}",shell=True)
