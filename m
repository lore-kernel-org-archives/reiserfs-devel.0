From: Oleg Drokin <green@namesys.com>
Subject: Re: rfs4, 2.5.53: jnode_flush failed with err = -12
Date: Mon, 6 Jan 2003 15:03:10 +0300
Message-ID: <20030106150310.A10661@namesys.com>
References: <20030106122217.A19841@humilis> <20030106143058.A9262@namesys.com> <20030106125500.B19841@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030106125500.B19841@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jan 06, 2003 at 12:55:01PM +0100, Ookhoi wrote:
> > > With kernel 2.5.53 and reiserfs4 snapshot of 24 Dec 2002 I get the
> > > following error when I try to untar a file on it.
> > > jnode_flush failed with err = -12
> > Errno 12 means "Out of Memory".
> > How much RAM do you have on your test box?
> 512MB.

Hm. Very strange.

> I don't have swap space. Could that be a problem?

Not likely. We were able (in fact we do that quite often) to untar compiled
kernel source that is bigger than your tar file both compressed and uncompressed
on 240M system.
I guess we need to release another snapshot with current code and see if it will
break for you again.
I am now merging our kernel bits to see how 2.5.54 will live with reiser4.

Bye,
    Oleg
