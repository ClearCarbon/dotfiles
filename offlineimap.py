import subprocess

def get_password(server):
  server = "personal/1and1-email"
  pw = subprocess.check_output(["pass", "show", server])
  return str(pw).strip().split("\n")[-1]
