From: "jenn sirp" <sirpj@ecs.csus.edu>
Subject: calling ioctl from user space
Date: Sun, 11 Apr 2004 09:52:00 -0700
Message-ID: <000f01c41fe5$4f9a4a60$0533a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I am messing with ioctl() in Reiser3. I am trying to write a simple C
program that calls the functions with the various cmd options. At the
moment, I just want to test that I am getting into the reiser ioctl
routines, but I am not sure I am going about this correctly.

I have a Resier partition on /dev/hda6 and mounted on /mnt
I am calling ioctl with something like ...

main()
{
int fd;
void * argp;

fd = open("/mnt/test.txt", "w");
ioctl(fd, REISERFS_IOC_UNPACK, argp)
}

I get various errors and have been checking errno. I get EBDAF (bad file
descriptor) when I pass a valid 'file' file descriptor but not if I pass '1'
for stdout. Maybe I am going about this the wrong way...Also... if anyone
can point me to which header files I need to include to access the right
flags etc.. -- that would be helpful too. For some reason, no matter what I
#include, I am getting compiler complaints and I can't call with
REISERFS_IOC_....etc.

Sorry if this is too much of an introduction to fs programming e-mail.

Thank you so much,

Jenn

