From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Chris: mason/patches/data-logging/experimental/2.6.1 upside down?
Date: Tue, 13 Jan 2004 22:47:05 +0100
Message-ID: <200401132247.05606.Dieter.Nuetzel@hamburg.de>
References: <3171912.lEEDWjxvxS@spamfreemail.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3171912.lEEDWjxvxS@spamfreemail.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Jens Benecke <jens-usenet@spamfreemail.de>, Chris Mason <mason@suse.com>

Am Dienstag, 13. Januar 2004 22:32 schrieb Jens Benecke:
> Hi,
>
> the "journal-writer.gz" in the above dir starts with
>
> diff -Nur --exclude=3DRCS --exclude=3DCVS --exclude=3DSCCS --exclude=3DBi=
tKeeper
> --exclude=3DChangeSet linux.dammit/fs/reiserfs/do_balan.c linux.25.1/fs
> reiserfs/do_balan.c
> --- linux.dammit/fs/reiserfs/do_balan.c Fri Jan  9 15:18:17 2004
> +++ linux.25.1/fs/reiserfs/do_balan.c   Thu Dec  4 14:20:19 2003
>
> and only REMOVES code, doesn't add anything.
>
> Any chance you patched the wrong way round? ;-)
>
>
>
> oh yes... and is the "data-logging.gz" on the state of the 2.4.23 patches
> that are also in your directory (ie. can I mount with journal=3Dordered e=
tc)?

See this, too.

Re: v3 logging speedups for 2.6

It's (SuSE 9.0 2.6.1) is running fine with reiserfs-journal-writer.

Greetings,
	Dieter

=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
