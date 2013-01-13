#!/usr/bin/python
# Author: jawashin, edthedev
# Last updated: Friday the 13th, 2012.04.13

import traceback
import socket # For hostname specific files.
import glob,re,sys,getopt,os

def usage():
  print "Usage: " + sys.argv[0] + " [options] "
  print " Options:"
  print "     -l --link               : Execute the dotfile building script"
  print "     -d --dst-directory <directory>    : Place links in the destination directory"
  print "     -s --src-directory <directory>    : Files to be dotted are sourced in this directory"
  print " By default, this will symlink all files from $HOME/.dotfiles/ into the $HOME directory."

def main():
  homedir = os.environ["HOME"]
  srcDirectory = os.path.dirname(os.path.abspath(__file__)) 
  dstDirectory = homedir
  link = False
  try:
    opts, args = getopt.getopt(sys.argv[1:], "ld:hs:", ["dst-directory=", "src-directory=", "help", "--src-directory", "--dst-directory","--link"])
  except getopt.GetoptError:
    # print help information and exit:
    usage()
    sys.exit(2)
  for o, a in opts:
    if o in ("-l", "--link"):
       link = True
    if o in ("-d", "dst-directory=", "--dst-directory"):
       dstDirectory = a
    if o in ("-s", "src-directory=", "--src-directory"):
       srcDirectory = a

  filelist = glob.glob1(srcDirectory,"*")
  #remove this script from the list
  try:
    filelist.remove("builddotfiles.py")
  except ValueError:
    pass
  if(link):
    for filename in filelist:
      dest_filename = localizeForHostName(filename)
      source = srcDirectory+"/"+filename
      dest = dstDirectory+"/."+dest_filename
      symlinkFile(source, dest)
  else:
     dryRun(srcDirectory,dstDirectory,filelist)

def localizeForHostName(filename):
  """If the filename contains the local hostname in it, assume it's meant to be a host-specific version.

  i.e.
  mycomputer-profile should link to ~/.profile if the local hostname is mycomputer

  myOtherComputer-profile will still link to ~/.myOtherComputer-profile; I don't care. 
  """ 
  hostname = socket.gethostname()
  if hostname in filename:
    updated_filename = filename.replace(hostname, '')
    return updated_filename.strip('-')
  return filename

# TODO: symlinkdirectory
#  (mainly for .ssh)


def symlinkFile(source, dest):
  try:
      os.unlink(dest)
  except:
    pass
  try:
    os.symlink(source, dest)
    print "Linked %s to %s" % (source, dest) 
  except:
    print "Failed to link %s to %s" % (source, dest) 
    
def dryRun(srcDirectory,dstDirectory,filelist):
  print "source: %s"%(srcDirectory)
  print "destination: %s"%(dstDirectory)
  for filename in filelist:
    print "link: %s to %s"%(srcDirectory+"/"+filename,dstDirectory+"/."+filename)

if __name__ == "__main__":
  main()

