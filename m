From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: On plugins, on-disk formatting and such
Date: Sat, 10 Apr 2004 13:07:01 +0300
Message-ID: <20040410100701.GE5229@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

First off I'd like to thank the Namesys guys for their excellent work,
the latest snapshot has been very stable for me, so stable in fact
that my life is boring because of it ;)

I have like a ton of questions so I'll just put them in this mail and
see which points get replied to. Hopefully all ;)

1) The xattrs issue never got any replies, although I gathered that it
   would be possible to map xattr calls to the Reiser4 API.
   Is this fact or fiction? What will the Reiser4 API look like, apart
   from control files?

2) Is metadata stored anywhere? If I want to organize all my libs in one
   fibre, I make it so, I reboot and do I then have to reset the fibration
   for the directory? Is it possible to have persistency here? Wouldn't
   a wrong fibration type make the files inaccessible?
   Is this addressed in the Reiser4 API somehow?

3) How big are the chances that the on-disk layout will still change?
   On IRC I've got the impression that the chance is next to none,
   and I thank you for that!
   Still, a lot of people are hesitant to try Reiser4 because of this
   fear. Doing an mkfs is not a small thing and some assurance would
   surely bring along community testing support.

4) http://thebsh.namesys.com/snapshots/2004.03.26/READ.ME
   4.1) I have used Reiser4 as my rootfs for a long, long time.
        Why does the READ.ME say I can't do it?-) I just never mount
        it read-only, so I don't have to remount it read-write and it
        just works. Is there something amiss here?
   
   4.2) What exactly does it mean that CONFIG_REISER4_COPY_ON_CAPTURE
        is stabler than before? Is it soon safe to configure in?
        Is it possible for me to test it on only one filesystem or
        do I risk rootfs (and home directory) stability by trying it
        out? If I compile it in, what's the best way of testing it?

5) If I wanted to write an fs plugin, I gathered that I would not have
   to mkfs again. Should this not require some persistency in metadata?
   I also gathered that Hans Reiser is against loadable kernel modules
   that are in essence filesystem plugins. Is this because a stray
   rmmod might cause breakage or something else?
   One of the good things for me in Linux is that I can use honest
   modules to try something, rmmod, recompile, insmod and I don't
   think this is any different.

6) I understood there are some NFS issues still left, what other issues
   are there? Is it possible to have some TODO list on the web so
   people could guess at what's going on? (BTW, Nikita, that doesn't
   mean I won't bug you in the future ;)

7) http://namesys.com/benchmarks.html#slow.2004.03.26
   That is awesome. Could someone give a brief, or rather human-readable,
   explanation on why Reiser4 refuses to slow down under those loads?
   Not that I'd find those benchmarks hard to swollow per se, I did
   see Reiser4 perform superior for myself.
   But what is the secret? Atomic transactions?

Thanks again for the good work and I hope this brings along some discussion
more interesting than the metas/ thread!

-- 
mjt

