From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel BUG at prints.c:334
Date: Mon, 6 Jan 2003 10:44:36 +0300
Message-ID: <20030106104436.A2174@namesys.com>
References: <hhr8bv7cm6.fsf@blah.pl> <20030106101149.B1881@namesys.com> <hhd6navifd.fsf@blah.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <hhd6navifd.fsf@blah.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

On Mon, Jan 06, 2003 at 08:36:22AM +0100, Maciej Matysiak wrote:

> btw., it appears for me that ibm disks have something like 'y2k3 problem'.
> it's a poor joke, but i got already 3 ibm disks that died in my servers this
> year. that one was working not even 3 weeks. all of them scsi, made in hungary

Ones from Hungary had pretty much of bad press for two years already starting
with infamous (IDE) DTLA-307030 series, I believe.

> > Yes, reiserfs is not very well prepared to I/O errors while writing to
> > journal, hence it panicked.
> but could the errors be a bit more descriptive, please :)

It said "I/O error doing so and so".
And lots of SCSI diagnostic from SCSI layer prior to that.
What do you consider to be more informative message (with example, please).

Bye,
    Oleg
