From: "Daniel Christiansen" <christiansen@albion.edu>
Subject: Error Code 255 and "Permission Denied"
Date: Sun, 05 May 2002 12:18:28 -0400
Message-ID: <scd52321.066@gwd.albion.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am using Mandrake 8.2 with the 2.4.18-6mdk kernel and reiserfsck
3.x.0j.  I have a reiser file system on my / drive hdb2 and /home hdb6. 
These are on a new 40G IBM hard drive.

Whenever I boot up sysinit cannot write to several files in /var/log, in
particular to dmesg.  I get a "Permission Denied" message. The same is
true when I try to access these five or six files as root.  I don't
think this is a permission problem; permissions are
/var/log drwxr-xr-x root root.

I ran reiserfsck from the rescue disk.  "Echo $?" showed error code 255.
 I can't find what this means.

The message in the logfile was"Node (8272) with wrong level (0) found in
the tree (should be 1)." [There was also a message on the screen of
"pass_through_tree: unable to read 2949119 block on device 0x4."]  The
--fix-fixable option didn't seem to do anything.
[Although, if I recall correctly, there was a message having to do with
resizing that I didn't understand.]

I started to use the --rebuild-tree option but was dissuaded by the
message about only using it if I was desperate.  Perhaps I need to take
a deep breath and use this option.

Other indications of a problem:  I ran the dmesg program from /bin and
got "Warning log replay starting on readonly filesystem" and lots of
"i/o failure trying to find stat data" messages.

Every hour or so I get about 25 new messages in /usr/var/messages like
the following (all having to do with block 8272):

"kernel: is_tree_node: node level 0 does not match to the expected one 1
kernel: vs-5150: search_by_key: invalid format found in block 8272.
Fsck?"

I would appreciate any suggestions as to how fix my problem.

[I tried to accurately transcribe the messages but as they are from my
office machine and I am sending this from home, I may have made a typo
or two.]

Thanks.

Dan Christiansen
Albion College
