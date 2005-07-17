From: Tarmo =?ISO-8859-1?Q?T=E4nav?= <tarmo@itech.ee>
Subject: reiserfs+acl makes processes hang?
Date: Sun, 17 Jul 2005 22:20:31 +0300
Message-ID: <1121628031.28770.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

(I've already sent this to lkml and the bug has been confirmed
a couple of times, but I though I should also send it to
reiserfs-list so here goes:)


I think I've found a bug in reiserfs acls. If triggered
it means that any program trying to access the partition,
where the bug occured, will just hang in D state, with
no way to kill the program.

Here's how to reproduce:
1. mount a reiserfs volume (loopmount will do) with "-o acl".
2. create a directory "dir"
3. set some default acl: setfacl -d -m u:username:rwX dir
4. cd dir
5. dd if=/dev/zero of=somefile1 bs=4k count=100000
(the idea is to run out of space)
6. now df should show 0 free space, if not then repeat 5.
7. echo "1" > somefile2 # this should hang infinitely

Now no program will be able to access the partition.

I haven't tried to reproduce it, but the same problem also happened
when a user hit his hard quota limit on my server. Then no program
could access his homedir.

