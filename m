From: Oleg Drokin <green@namesys.com>
Subject: Re: Quotas aand 2.5.x
Date: Tue, 14 Jan 2003 20:54:30 +0300
Message-ID: <20030114205430.A19120@namesys.com>
References: <20030114182217.4fa8f2f8.philippe.gramoulle@mmania.com> <20030114203842.A18999@namesys.com> <1042566549.31100.1305.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1042566549.31100.1305.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Philippe Gramoull? <philippe.gramoulle@mmania.com>, reiserfs <reiserfs-list@namesys.com>

Hello!

On Tue, Jan 14, 2003 at 12:49:09PM -0500, Chris Mason wrote:

> > I think that new quota stuff is included into 2.5 already. If my guess is right,
> > I will look into porting quota code into 2.5 later this week.
> Right, Jan Kara's quota v2 stuff is in, so all we need in reiserfs is
> the nesting code.  I'd much rather use the data logging code for this
> than port the data logging stuff on top of nesting again.
> I've got data logging for 2.4.21-pre in testing now, and once that is
> done with I'll get back to 2.5.

Ok, then I will find some other task to spend my time on ;)

Bye,
    Oleg
