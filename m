From: jlewis@lewis.org
Subject: Re: Mount fails after reiserfsck --rebuild-tree failure
Date: Wed, 17 Mar 2004 13:00:49 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0403171252420.20192@web1.mmaero.com>
References: <40588E59.8080002@viva-solutions.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40588E59.8080002@viva-solutions.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, 17 Mar 2004, KAA wrote:

>   vs-5150: search_by_key: invalid format found in block 6377300. Fsck?
> Mar 17 13:23:44 gate kernel: vs-13070: reiserfs_read_locked_inode: i/o
> failure occurred trying to find stat data of [13247 14
> Mar 17 13:23:44 gate kernel: is_tree_node: node level 0 does not match
> to the expected one 1

This reminded me, when our server was having serious issues with fs
corruption, once we upgraded to a kernel that the corruption didn't crash,
we got lots of log messages like:

is_tree_node: node level 13624 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 8451301. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find
stat data of [7228813 7505972 0x0 SD]

The trouble is, these errors don't tell you which partition is generating
the messages...so you have to unmount and reiserfsck them all to eliminate
them all.  It'd be nice if they'd at least prepend the device name to the
message, so you knew which partition was in trouble.

One last thing, before I leave the list...has it been considered to
restrict posting to list members?  It seems like I've gotten a couple
spams a day through this mailing list.  I don't think it's too much to ask
of someone seeking support here that they subscribe to the mailing list
before posting their pleas for help.  That's what I did...as I assumed it
was the right way to go.

----------------------------------------------------------------------
 Jon Lewis *jlewis@lewis.org*|  I route
 Senior Network Engineer     |  therefore you are
 Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
