From: Sander van Beek <raze@xs4all.nl>
Subject: Troubles after --rebuild-tree
Date: Wed, 11 Jan 2006 09:51:55 +0100
Message-ID: <6.2.1.2.0.20060111094538.0357b028@pop.xs4all.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello everyone,

I'm new on this list so first I would like to say hi :)

I have a problem:
We have a reiserfs partion in use on one of the servers. Because some files 
that were deleted had to be recoverd, the command reiserfsck --rebuild-tree 
-S -l /root/recovery.log was run. No backup of the partion was made before 
running this command. Yes, we know, don't even start..
The first time, in the first 1 or 2 minutes it was interrupted. After that, 
it was rerun and finished.
We remounted the filesystem and that is where troubles began. Some files 
seem to be missing. Others appear damaged.
We do have the logfile and the lost+found directory full or files.
Is there any chance to repair the damage done with these two, or at least 
get some data back? How can this be done? Or should we leave it up to the 
expert? Any help or suggestions would be appreciated.

Regards,
Sander

