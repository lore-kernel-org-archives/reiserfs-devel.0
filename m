From: Oleg Drokin <green@namesys.com>
Subject: Re: corrupted fs: bitmap does not match to the correct one....
Date: Wed, 15 May 2002 18:06:09 +0400
Message-ID: <20020515180609.A2073@namesys.com>
References: <20020515170855.A986@namesys.com> <19890.1021471126@www22.gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <19890.1021471126@www22.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grobe@gmx.net
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 15, 2002 at 03:58:46PM +0200, grobe@gmx.net wrote:

> > > I have a bad problem with my reiserfs. I got a lot of SCSI-errors in the
> > > Hm. SCSI errors are bad, and you have performed everything on the same
> > hardware?
> Yes, a Serveraid 4M with a EXP15 Raid 5 attached. Curent kernel (2.4.16),
> current firmware, current driver (and UNCHANGED!).
> > What kind of errors was there, by the way?
> May 15 12:54:01 Zeus kernel:  I/O error: dev 08:11, sector 211045693
> [... a lot of these ...]

Ah, failing hardware.
Unfortunatelly we only deal with failing harddrive based on
http://namesys.com/support.html terms.

> > What version of reiserfsprogs was used?
> 3.x.0j

That's way too old.

> > How about more error messages about scsi errors in the logs?
> As I mentioned,  I can't mount any more, so no more messages...

Hm. So you read corrupted on-disk infortmation with reiserfsck, then wrote it
back. That'd going to hurt for sure.

> > There is always a chance, another question (rather important in your case,
> > it seems) is what option would be faster.
> That's what I need to know ;-) In fact, the backup is on an IDE-Array, I
> dont get more than 10MB/s from the backup server, and i have 300GB of data...

I'd say you'd better stay using your backups (on a different hard drive(s)).
Also you probably want to ask whoever sold you the failing harddrive to replace
it.

Bye,
    Oleg
