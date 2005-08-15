From: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 11:08:38 -0700
Message-ID: <d9a6586e0508151108431fabba@mail.gmail.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>
	 <20050815125025.GA29390@tranquility.scriptkitchen.com>
	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>
	 <4300A603.2050602@namesys.com>
	 <d9a6586e05081509195017d679@mail.gmail.com>
	 <4300D240.7010109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4300D240.7010109@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On 8/15/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> I must be misunderstanding something. Half of reiser4' complexity is abou=
t to make disk writes and reads
> more sequential to decrease number of hard disk head seeks.
> IMHO, filesystem for storage devices which do not have moving mechanical =
parts can go better without such code.

Well so far the choices are FAT and EXT2, both of which have
well-known limitations.  I'm trying to get set up to compile things on
the zaurus, and installing gcc requires symlinks so I had to quit
using FAT.

JFFS2 is used for the internal flash but is overkill for a CF card (as
well as not designed for it, and thus would require a lot of changes
to make it possible).

What I want is an FS that never loses data because of a crash (writes
should be atomic) and doesn't ever need to be fsck'd, yet still is
very fast and caches writes and accumulates writes, so that repeated
writes to the same file result in only one physical write.
