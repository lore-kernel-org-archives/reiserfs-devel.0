From: Aaron D. Ball <adb@bdi.com>
Subject: knfsd and append-only attribute:  "operation not permitted"
Date: Thu, 20 Jan 2005 13:45:53 -0500
Message-ID: <8381054C-6B13-11D9-BFA6-000D933B35AA@bdi.com>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

When I use the kernel-based NFS server to export directories on 
ReiserFS that have the append-only attribute set, I can't access the 
files from the client machines at all:  for example, "ls" returns 
"operation not permitted".  Is this a known bug?  Is there a good 
workaround?

I'm running up-to-date Debian sid with Linux 2.6.10 compiled from the 
stock Debian kernel-source package.  Everything works fine in other 
contexts, such as

* direct access on the server
* access via Samba
* access via the userspace NFS server (which I'm using as a workaround 
for now)

I'd really like to get things working with the kernel-based server so I 
can have locks.  Abandoning extended attributes would mean I have to 
monitor certain files and directories for changes and check them after 
the fact rather than simply blocking all the changes I don't want.  Is 
there hope?  Am I just doing something dumb?

