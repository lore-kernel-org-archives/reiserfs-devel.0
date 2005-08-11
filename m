From: sergey ivanov <seriv@parkheights.dyndns.org>
Subject: Re: reiser4 problem with pam_mktemp
Date: Thu, 11 Aug 2005 07:01:58 -0400
Message-ID: <42FB3026.1050609@parkheights.dyndns.org>
References: <42E907E4.7090003@parkheights.dyndns.org> <42ECD354.8010304@namesys.com> <42F97768.5010602@parkheights.dyndns.org> <42F9EF8E.8050403@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25413-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F9EF8E.8050403@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have not succeeded with integrating reiser4 & pam_mktemp.
From one side I recompiled kernel with reiser4 patches modified to
return ENOTTY for attempt to deal with attributes, as tmpfs does.
Pam_mktemp does not work after this. So I returned to the kernel with
original Namesys' patches.
Then by my apeal pam_mktemp was modified to recognize ENOSYS the same
way it recognizes ENOTTY returned by tmpfs and try to deal without
attributes.
But this also does not help pam_mktemp to work.
So I did the following: rebooted to runlevel 1, and then did
# strace -o su.log -fF su - seriv
Once with /tmp on tmpfs and once with /tmp on reiser4.
And the following catches my attention: while on tmpfs, the lines
dealing with attributes looks like the following:
---
2034 mkdir("/tmp/.private", 0711) = 0
2034 lstat64("/tmp/.private", {st_mode=S_IFDIR|0711, st_size=40, ...}) = 0

2034  open("/tmp/.private", O_RDONLY)   = 3
2034  ioctl(3, EXT2_IOC_GETFLAGS, 0xbfb7aab8) = -1 ENOTTY (Inappropriate
ioctl for device)
2034  close(3)                          = 0
2034  mkdir("/tmp/.private/seriv", 01700) = 0
2034  open("/tmp/.private/seriv", O_RDONLY) = 3
2034  ioctl(3, EXT2_IOC_GETFLAGS, 0xbfb7aa88) = -1 ENOTTY (Inappropriate
ioctl for device)
2034  close(3)                          = 0
2034  chown32("/tmp/.private/seriv", 0, 500) = 0
2034  chmod("/tmp/.private/seriv", 01770) = 0
---
But with /tmp on reiser4, they are:
---
1993  mkdir("/tmp/.private", 0711)      = -1 EEXIST (File exists)
1993  lstat64("/tmp/.private", {st_mode=S_IFDIR|0711, st_size=7, ...}) = 0
1993  open("/tmp/.private", O_RDONLY)   = 3
1993  ioctl(3, EXT2_IOC_GETFLAGS, 0xbf9e37f8) = -1 EISDIR (Is a directory)
1993  close(3)                          = 0
1993  mkdir("/tmp/.private/seriv", 01700) = -1 EEXIST (File exists)
1993  open("/tmp/.private/seriv", O_RDONLY) = 3
1993  ioctl(3, EXT2_IOC_GETFLAGS, 0xbf9e37c8) = -1 EISDIR (Is a directory)
1993  close(3)                          = 0
1993  getuid32()                        = 0
1993  write(2, "Account management:- Cannot make"..., 85) = 85
---
So it looks like reiser4 tries to be good and answer to ioctl
getting/setting attributes "EEXIST" and "EISDIR",
and not return error "ENOTTY".
This is the reason, why pam_mktemp passes the tests if filesystem
support attributes with confidence that reiser4 can do attributes.
I think this was the right decision to return fake successes at the
beginning of reiser4 development, but now I think reiser4 should behave
more strictly and rejects this attribute setting/getting ioctl by ENOTTY
codes.
-- 
	Sergey





