From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: REISER4 "strange" partition size
Date: Fri, 23 Jan 2004 17:52:53 +0300
Message-ID: <16401.13637.883146.415372@laputa.namesys.com>
References: <20040123144652.31406.qmail@web21501.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040123144652.31406.qmail@web21501.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paolo Correnti <paolunix@yahoo.com>
Cc: REISER LIST <reiserfs-list@namesys.com>

Paolo Correnti writes:
 > Hallo,
 > 
 > as anyone experience with this e-mail object ?
 > 
 > I'm testing kernel 2.6.1 + latest snapshot
 > and I've noticed that if a use mkreiserfs 
 > and mkfs.reiser4 on 2 partitions of the same size
 > with df I obtain that reiser4 partition has "lost"
 > about 5% of space (for example on a 4 Gb partition
 > I see 3,8 Gb).

Good catch!

These 5% are reserved by reiser4 for internal use.

 > 
 > Then making intensive writing test on this reiser4
 > partition (for example: writing 1 million rows on an
 > Oracle table in archivelog mode) on each test I obtain
 > a corrupted redolog file [sometimes is recoverable,
 > sometimes I've to rebuild the entire DB).
 > 

Hmm...

It is not clear how to diagnose this. What oracle are you using? Is it
available freely?

Also you can compile reiser4 with CONFIG_REISER4_CHECK and
CONFIG_REISER4_DEBUG on, but it will run _much_ _more_ _slowly_.

 > 
 > I've never had this kind of problem with kernel 2.6.0
 > and last 2003 snapshot.
 > 
 > Best regards
 > 
 > Paolo
 > 

Nikita.
