From: Joachim Wagner <jwagner@computing.dcu.ie>
Subject: Re: fsck option --lost-and-found
Date: Sat, 30 Dec 2006 13:37:03 +0100
Message-ID: <200612301337.03373.jwagner@computing.dcu.ie>
References: <200612271816.54908.jwagner@computing.dcu.ie> <200612281612.18265.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30347-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200612281612.18265.vs@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

> reiserfsck is supposed to create lost+found if it does not exist. 3.6.18
> has  a bug. 3.6.19 is better, but it also has problem with lost+found.
Sorry that I didn't look at the differences between 3.6.18 and 3.6.19 in the 
first place and give 3.6.19 a try. The change_log didn't say anything about 
lost+found and I assumed that one of the few things went wrong that can go 
wrong in the function make_sure_lost_found_exists. If you think that this is 
very unlikely and I only experienced a 3.6.18 bug, I understand that my patch 
will not be included.

> ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.19.tar.gz fixes them.
(1) I ran diff -r with and without -w and noticed many changes in whitespace, 
mostly in struct definitions. You may want to fix this before the release of 
3.6.20.
(2) I looked at the differences of the function make_sure_lost_found_exists 
(which now moved from semantic_rebuild.c to lost+found.c)  and looked into 
reiserfs_add_entry of the 2.6.13-15.13 SuSE kernel to see what happens if 
namelen is -1. (Checking for this situation is what has been added since 
3.6.18 to make_sure_lost_found_exists.) The first thing that will cause 
problems is a call to memcpy with count -1. This will overwrite 4 GB of 
kernel memory on 32-bit i686. Shouldn't that cause a page fault or kill the 
whole system? Then the bug I experienced most have been a different one 
because this didn't happen.

> successfull reiserfsck is supposed to leave a filesystem in consistent
> state [...]
Thinking about this a little bit more, reiserfsck is neither supposed to be a 
full-blown data recovery tools (that would not write to the fs at all) nor a 
replacement for mkreiserfs + restore of a backup. Its major advantage is that 
it often brings back a system without any human interaction and at higher 
speed than the start-from-scratch option (at least if --rebuild-tree is not 
necessary).

Joachim
