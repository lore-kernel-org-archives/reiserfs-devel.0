From: Andrew Heberle <heberle@westnet.com.au>
Subject: Error message - vs-13070
Date: Sat, 15 Feb 2003 00:26:53 +0800
Message-ID: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Twice in the last four days I have found the following message in one of my 
systems logs:

vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1718696 1718710 0x0 SD]

I have managed to track this error back to a particular file.

When attempting an 'ls' on the file in question I get a "Permission denied" 
message.

The error suggests a bad block on the hard drive where that file exists I 
assume?

I have yet to run reiserfsck on the machine as it is well backed-up, 
working fine at the moment (the file in question is only ever touched 
during updates of the slocate database), and I can't take it down to run 
reiserfsck at the moment anyway (the error is on the root partition).

I suppose I am just wanting confirmation that based on the error message 
this is likely to be a hardware issure rather than being caused by an 
as-yet unknown corruption bug in reiserfs (I find this very unlikely based 
on my past, very stable history with reiserfs).

--
Andrew Heberle

