From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs v3 patches updated - Bug
Date: Wed, 7 Apr 2004 11:28:17 +0200
Message-ID: <200404071128.17846.christian.mayrhuber@gmx.net>
References: <1081210239.4994.69.camel@watt.suse.com> <200404061838.05099.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404061838.05099.christian.mayrhuber@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 06 April 2004 18:38, Christian Mayrhuber wrote:

> On Tuesday 06 April 2004 02:10, Chris Mason wrote:
>
> Seem to run fine so far with
I've to correct myself. There seems to be a problem with
install. Version: install (coreutils) 5.0.91

install: cannot change owner of ,,/tmp/mkinitrd.18919/initrd/bin/echo" : 
operation not permitted

I can change the owner with chown without problems.
I tried with the mount options "rw,noatime,nodiratime,data=writeback".

"data=writeback" seems to get ignored. The fs always mounts with 
data=ordered.

This is a bug that has been introduced somewhere between 2.6.4 + data-logging
and 2.6.5 + data-logging, as install works fine unter 2.6.4 + data=ordered.

It has nothing to do with acl's, because this bug appears with and without
the acl mount option. The block allocator does not matter, too.


PS: If invalid mount options are specified to reiserfs it mounts "ro", but the 
invalid options show up in /proc/mounts. This makes it impossible to do a
mount -o remount,ro /
because all the wrong options are retained.
==> fstab cannot be fixed, reboot with other kernel required.
I suggest to print a warning for the invalid options and to ignore them
during mount.

-- 
lg, Chris
