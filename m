From: "David Dabbs" <david@dabbs.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Sun, 22 Aug 2004 05:45:09 -0000
Message-ID: <20040822054509.351BC15D06@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, George Beshers <gbeshers@comcast.net>
Cc: reiserfs-list@namesys.com


>
>The LSM paper cited (that does not require paying money) says very 
>little about what they do with regards to the filesystem.  Do you have a 
>more informative URL?
>

Here's a concrete example of an LSM directory jail implementation. Not all the features I think you're aiming for but it is source and is indicative of what is possible (er, has already been done) with LSM.

David



http://lwn.net/Articles/57713/

From:   "Serge E. Hallyn" <hallyn@CS.WM.EDU> 
To:   linux-security-module@wirex.com 
Subject:   dirjail module 
Date:   Mon, 10 Nov 2003 23:42:26 -0500 


Attached are the header comments for a new LSM.  I wrote it a few
months ago to address a particular need in a large-scale installation
for which DTE would have been inefficient.  The module source can be
found at http://www.cs.wm.edu/~hallyn/dirjail.c.

I'll be curious to see if anyone else sees any use for this.

-serge

/*
 * File: dirjail.c
 *
 * Description: Intended as an efficient prison for suspect child processes.
 *
 *  Assume a large set of users.  Each has a directory under, say,
 *  /home/sxx/username, where xx is a number from 00-03, and username
 *  is the account name.  Their files may be served and processed by
 *  system processes and scripts (apache, accounting, etc).  However,
 *  they may also, under /home/sxx/username, place their own scripts.  You
 *  wish to confine the scripts to MOSTLY access only /home/sxx/username.
 *
 *  modprobe dirjail
 *  for count in 00 01 02 03; do
 *    echo -n /home/s$count > /proc/jails
 *  done
 *  echo -n /bin > /proc/exec_exceptions
 *  echo -n /lib > /proc/exec_exceptions
 *  echo -n /tmp > /proc/rw_exceptions
 *  echo -n /proc > /proc/read_exceptions
 *
 *  Now a script started from under /home/s01/user3 will be confined to
 *  only read, write, and execute files under /home/s01/user3.  Exceptions
 *  to this are:
 *    it may execute anything under /bin
 *    it may read and write under /tmp
 *    it may read under /proc
 *
 *  For the sake of simplicity, directory rx is always allowed.
 *  However, directory write and file rwx are restricted.
 *
 *  Any children of said process will be convined to the same jail.
 *
 * Copyright (C) 2001 Serge E. Hallyn <hallyn@cs.wm.edu>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 */


