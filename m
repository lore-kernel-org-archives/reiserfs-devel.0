From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: calling ioctl from user space
Date: Sun, 11 Apr 2004 14:39:29 -0400
Message-ID: <407990E1.7060908@suse.com>
References: <000f01c41fe5$4f9a4a60$0533a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000f01c41fe5$4f9a4a60$0533a5d1@energy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jenn sirp <sirpj@ecs.csus.edu>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jenn sirp wrote:
| Hello,
|
| I am messing with ioctl() in Reiser3. I am trying to write a simple C
| program that calls the functions with the various cmd options. At the
| moment, I just want to test that I am getting into the reiser ioctl
| routines, but I am not sure I am going about this correctly.
|
| I have a Resier partition on /dev/hda6 and mounted on /mnt
| I am calling ioctl with something like ...
|
| main()
| {
| int fd;
| void * argp;
|
| fd = open("/mnt/test.txt", "w");
| ioctl(fd, REISERFS_IOC_UNPACK, argp)
| }
|
| I get various errors and have been checking errno. I get EBDAF (bad file
| descriptor) when I pass a valid 'file' file descriptor but not if I
pass '1'
| for stdout. Maybe I am going about this the wrong way...Also... if anyone
| can point me to which header files I need to include to access the right
| flags etc.. -- that would be helpful too. For some reason, no matter
what I
| #include, I am getting compiler complaints and I can't call with
| REISERFS_IOC_....etc.
|
| Sorry if this is too much of an introduction to fs programming e-mail.

Jenn -

sys_ioctl (fs/ioctl.c) handles the resolution of a file descriptor into
an internal structure that the rest of the kernel knows about. When the
file descriptor passed doesn't match anything in the file table for that
process, you get an -EBADF. This is done before the reiserfs code is
even in play. When you pass stdout, you'll make it past the file
descriptor check, but unless you're redirecting your output to a file on
a reiserfs filesystem, you're not going to run reiserfs_ioctl
eventually. Assuming you're ssh'd in or using some sort of windowing
system, your stdout will be a pseudoterminal, and you'll get the set of
ioctls associated with that driver.

The behavior you should be seeing while passing stdout to ioctl and
calling with REISERFS_IOC_UNPACK is -EINVAL.

For some reason or another, you're passing an invalid file descriptor to
ioctl when you're using a "real" file. I'm not sure if the code you've
included is pseudocode or not, but open(2) takes a different set of
arguments than fopen(3). "w" isn't a valid flag for open().

Try re-running your test with stdout and redirecting stdout to a file on
a reiserfs filesystem.

As far as including the ioctls, I'm sorry to say that there's no better
method at the moment than including <sys/ioctl.h>, followed by pasting
the ioctl #defines from include/linux/reiserfs_fs.h

There's too many kernel data structures and static inline references in
reiserfs_fs.h to be included from user space.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAeZDgLPWxlyuTD7IRAu66AJ9x5S9wVirAzSHSudFgEIzvHZAacQCfcVDa
jlm0s77TqqKn+b6M+ay0ni8=
=EhGC
-----END PGP SIGNATURE-----
