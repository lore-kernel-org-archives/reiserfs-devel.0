From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: cheap quota systems (was: Re: Corrupted/unreadable journal: reiser vs. ext3)
Date: 23 Feb 2003 15:35:38 -0500
Message-ID: <b3bbaq$v9e$1@satsuki.furryterror.org>
References: <3E50B398.306B0AC7@interface-ag.com> <3E50B398.306B0AC7@interface-ag.com> <86isvfg2rr.fsf@trasno.mitica>
Return-path: <reiserfs-list-return-12879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <86isvfg2rr.fsf@trasno.mitica>,
Juan Quintela  <quintela@mandrakesoft.com> wrote:
>that 5-10% is there not for the superuser (with today disks, that is
>a lot of space).  I was also going to reduce the percentage, but then
>somebody explained me that this porcentange needs to be free at all
>times to maintain the fragmentation low.  And that makes a lot of
>sense, the bigger the disk, the more free space you need to have low
>fragmentation.

The purpose may originally have been to reduce fragmentation, but it
is certainly _useful_ as a kind of cheap quota system.  And if you
look closely at the ext[23] superblock, you'll notice that the extra
amount can be allocated to specific users, or even groups, instead
of root.

This is by far the one feature of ext[23] that I miss most on reiserfs.
Usually I don't need quotas or separate partitions, but I do need the
system to be able to write system logs or queue mail for a few hours
after a non-privileged user fills up the entire disk, and that's usually
the only reason why I'd normally want to restrict any user's ability to
use all available disk space.

It's possible to achieve this effect using quotas or partitions, but
the administrative overhead is excessive--in the normal case I'd have
to adjust normal Unix-style disk quotas of all users in real time,
or repartition read-write mounted filesystems on the fly.  Filling in
the appropriate values in an ext2 superblock is quick, easy, fast,
and often sufficient.

The feature I'd _really_ like to see is a kind of "negative" quota.
Instead of an upper bound on the total amount of space a user uses, I'd
prefer to specify a lower bound on the amount of free space left on the
disk before allowing a user to allocate more.  This would allow classes of
users to share limited disk space at different thresholds of "fullness",
where allocation of the total space within a class is limited but
allocation of space by particular users in a given class is not
restricted.  Note that by "user" I usually mean "server process uid" here.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
