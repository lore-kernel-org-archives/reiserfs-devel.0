From: Hans Reiser <reiser@namesys.com>
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 08:15:04 -0700
Message-ID: <407AB278.8030209@namesys.com>
References: <20040410100701.GE5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040410100701.GE5229@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com, Nikita Danilov <god@namesys.com>, vitaly@thebsh.namesys.com, vs <vs@thebsh.namesys.com>

Markus T=F6rnqvist wrote:

>First off I'd like to thank the Namesys guys for their excellent work,
>the latest snapshot has been very stable for me, so stable in fact
>that my life is boring because of it ;)
> =20
>
oh excellent, I think we just have to fix a problem with crashing when=20
mmap consumes all of memory, and we are ready to ship

>I have like a ton of questions so I'll just put them in this mail and
>see which points get replied to. Hopefully all ;)
>
>1) The xattrs issue never got any replies, although I gathered that it
>   would be possible to map xattr calls to the Reiser4 API.
>   Is this fact or fiction? What will the Reiser4 API look like, apart
>   from control files?
> =20
>
I don't understand your question.  We don't use xattrs and I think they=20
should never have been put into the kernel.  We will not burden our code=20
with support for them.

Instead, you can access metas to do everything that xattrs do, or at=20
least that is our development direction.  We will never support xattrs.

>2) Is metadata stored anywhere? If I want to organize all my libs in one
>   fibre, I make it so, I reboot and do I then have to reset the fibration
>   for the directory? Is it possible to have persistency here? Wouldn't
>   a wrong fibration type make the files inaccessible?
>   Is this addressed in the Reiser4 API somehow?
> =20
>
I will let nikita answer this, hopefully by adding to our web pages and=20
sending you the URL.....;-)

>3) How big are the chances that the on-disk layout will still change?
> =20
>
Because plugins make it easy and painless for users, you can expect it=20
to change all the time.  If you mean change without grace, we try to=20
avoid that.  Unfortunately curing a recent discovery that we cannot do=20
it gracefully (in regards to inheritance) required a non-graceful change=20
to cure it, sorry about that.  I still need to review that code to make=20
sure all issues regarding inheritance and defaults are fully graceful.

>   On IRC I've got the impression that the chance is next to none,
>   and I thank you for that!
>   Still, a lot of people are hesitant to try Reiser4 because of this
>   fear. Doing an mkfs is not a small thing and some assurance would
>   surely bring along community testing support.
>
>4) http://thebsh.namesys.com/snapshots/2004.03.26/READ.ME
>   4.1) I have used Reiser4 as my rootfs for a long, long time.
> =20
>
Thanks, Vitaly fix that.

>        Why does the READ.ME say I can't do it?-) I just never mount
>        it read-only, so I don't have to remount it read-write and it
>        just works. Is there something amiss here?
>  =20
>   4.2) What exactly does it mean that CONFIG_REISER4_COPY_ON_CAPTURE
>        is stabler than before? Is it soon safe to configure in?
>        Is it possible for me to test it on only one filesystem or
>        do I risk rootfs (and home directory) stability by trying it
>        out? If I compile it in, what's the best way of testing it?
> =20
>
vs should answer this one

>5) If I wanted to write an fs plugin, I gathered that I would not have
>   to mkfs again. Should this not require some persistency in metadata?
>   I also gathered that Hans Reiser is against loadable kernel modules
>   that are in essence filesystem plugins. Is this because a stray
>   rmmod might cause breakage or something else?
> =20
>
It is because I want either code or money from those who  build on top=20
of reiser4.  Allowing people to escape the GPL for free is not to my=20
advantage.  Also, I don't want to find out whether it affects performance.

>   One of the good things for me in Linux is that I can use honest
>   modules to try something, rmmod, recompile, insmod and I don't
>   think this is any different.
> =20
>
Hmmm, when your NVIDIA drivers lag a few releases and you don't have the=20
source, fun, yes?

>6) I understood there are some NFS issues still left,
>
I think those got cured, but haven't made it into the latest snapshot.
 Elena, add these words somewhere:

This performance advantage is due to allocate on flush allowing us to=20
write in huge extents at flush time even though files get written to in=20
slow trickles.  This improves b

>   Not that I'd find those benchmarks hard to swollow per se, I did
>   see Reiser4 perform superior for myself.
>   But what is the secret? Atomic transactions?
>
>Thanks again for the good work and I hope this brings along some discussion
>more interesting than the metas/ thread!
>
> =20
>


--=20
Hans

