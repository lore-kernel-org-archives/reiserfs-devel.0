From: Ookhoi <ookhoi@humilis.net>
Subject: fsck on boot (was: Re: Corrupted/unreadable journal: reiser vs. ext3)
Date: Tue, 18 Feb 2003 08:04:48 +0100
Message-ID: <20030218080448.A19634@humilis>
References: <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <20030215153710.A1723@schatzie.adilger.int>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030215153710.A1723@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Andreas Dilger wrote (ao):
> The other thing to keep in mind is that you can have different
> "levels" of automated fsck at boot time, depending on how long they
> take.  You never necessarily have to try and fix anything with "fsck
> -a", just detect errors and leave it up to the user to decide what to
> do if you find a problem: - always recover journal, validate
> superblock, error flag (< 1s)
> 
> Don't know how long it takes these things to run, so it is up to you
> to trade off checks vs. speed, and you could even round-robin them
> (storing the last checked item in the superblock or something):
> - check block allocation bitmaps match superblock counts
> - walk directory structure from root, checking for directory
>   corruption
> - check btree validity on inodes for up to 10 seconds (or whatever,
>   storing last checked inode in superblock for restarting this test at
>   next one)
> 
> By all means, don't do checks for an hour, or allow users to set the
> maximum boot check duration in the superblock.  I'm sure users don't
> mind waiting 5s at boot time if it means they don't lose data.

Yes! Yes! I agree so much on this .. Let fsck always run at boot, and
perform checks which take at most a few seconds all together.

Then dmesg will tell if something is wrong. Maybe it can also show the
error code in /proc/mounts ?
