From: Michele Nicosia <michele.nicosia@lastminutetour.com>
Subject: Crash recovery after a shutdown, lvm,reiser3.6,2.4.26, lost files
Date: Wed, 08 Sep 2004 14:43:40 +0200
Message-ID: <413EFE7C.2030006@lastminutetour.com>
References: <918973493892.65637@bao72@lendingflow.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <918973493892.65637@bao72@lendingflow.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs-list <reiserfs-list@namesys.com>

Hi all,
    yesterday, after more tha three months of hard and good work, i 
shutted off my server, to test the start script in case o remote reboot.
After the shutdown, that apparently didn't show nothing abnormal, one of 
my larger lvm, with the home's users reported an error.
At a fist seen one disk seems to be not mounted becuase the vg/pv did 
not start.
After a restore of my lvm configuration, that vg/lv started correctly.
But many errors comes out :

Sep  7 20:14:26 giove kernel: for (lvm(58,1))
Sep  7 20:14:26 giove kernel: lvm(58,1):Using r5 hash to sort names
Sep  7 20:14:26 giove kernel: is_tree_node: node level 0 does not match 
to the expected one 2
Sep  7 20:14:26 giove kernel: lvm(58,1):vs-5150: search_by_key: invalid 
format found in block 12022576. Fsck?
Sep  7 20:14:26 giove kernel: lvm(58,1):vs-2140: finish_unfinished: 
search_by_key returned -2

And so on.
The reiserfsck without option, did not solve anything.
The disk was mountable, but a lot of damaged link insted of normal files 
were in many directory.
THe last thing to test was --rebuild-tree, that solved the problems of 
the damaged files, but not like i thinked, it was created a lost+found 
dir with a lot of  file, more than 30.000 and subdir.
I do not understand what happens, with an old server, 2.2.X and reiserfs 
3.5 without lvm, i switched of a lot of time with some partition of more 
than 100 g and NEVER a file was losted.
I forgot to say that into the lost+found i have only  file of  the 
courier maildir, but some well know  file, some avi's of 400mega, was 
completely lost!!
Why this happens?
Is the couple lvm-reiser less solid than reiser directly on a partition?

Thanks for any info, and sorry for the bad english.

Michele


