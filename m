From: Fionn Behrens <fionn@unix-ag.org>
Subject: Re: Re: Strange Syslog messages - this is NOT an isolated case!
Date: Mon, 30 Sep 2002 15:56:29 +0200
Message-ID: <20020930155629.07d32ecb.fionn@unix-ag.org>
References: <20020930125753.5d05d7ea.fionn@unix-ag.org>
	<20020930150940.A26589@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020930150940.A26589@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 30 Sep 2002 15:09:40 +0400
Oleg Drokin <green@namesys.com> wrote:

> Hello!
> 
> On Mon, Sep 30, 2002 at 12:57:53PM +0200, Fionn Behrens wrote:
> 
> > * reiserfsck --fix-fixable claims there are NO errors.
> > * I have 2.4.19, too
> > * I am using reiserfsprogs 3.6.3 from the Debian
> >   reiserfsprogs 3.6.3-1 package.
> 
> Hm. Can you try reiserfsprogs 3.6.4-pre2 from our ftp server please?
> ( ftp://ftp.namesys.com/pub/reiserfsprogs/pre )

Indeed this version of reiserfsck fixed the problem. Thanks for the link.

> > P.P.S: As a side note: Is there _any_ way to convert old 3.5/rupasov
> > volumes
> >        to newer formats without copying half a terabyte over and over
> >        again?
> 
> There is no way to change hash, you can convert v3.5 fs to v3.6 one
> by using -o conv swith to the mount command (only once).
> Note that while FS will become v3.6 one and all new files will be created
> in new format, all the old files will remain in old format until you remove
> and recreate them.

Thanks for the hint as well.

Is there any place to check for an explanation what exactly is different with
newfiles versus old files (save from the source that is)?

I am very pleased to report that it seems none of our files have taken damage
and I am impressed by the speed of response on this list. Thank you all.

Ah - and regarding the hash change: I guess it wont be done with $25, would it
;-) Maybe I am going to find that in a future version som day. Its not that I
would be in a hurry and need it badly. I was just curious.

With kind regards,
		Fionn
-- 
Because of the ad skips.... It's theft. [...] Any time you skip a
[TV] commercial or watch the button you're actually stealing the programming. 
[...] I guess there's a certain amount of tolerance for going to
the bathroom.              *** Jamie Kellner, AOL Time Warner  (serious!)
