From: Chris Mason <mason@suse.com>
Subject: Re: Quotas aand 2.5.x
Date: 14 Jan 2003 12:49:09 -0500
Message-ID: <1042566549.31100.1305.camel@tiny.suse.com>
References: <20030114182217.4fa8f2f8.philippe.gramoulle@mmania.com>
	 <20030114203842.A18999@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030114203842.A18999@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Philippe Gramoull? <philippe.gramoulle@mmania.com>, reiserfs <reiserfs-list@namesys.com>

On Tue, 2003-01-14 at 12:38, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Jan 14, 2003 at 06:22:17PM +0100, Philippe Gramoull? wrote:
> > Just a question:
> > Does quotas for ReiserFS V3 are likely to be available for 2.5.x kernel anytime soon ?
> 
> I think that new quota stuff is included into 2.5 already. If my guess is right,
> I will look into porting quota code into 2.5 later this week.

Right, Jan Kara's quota v2 stuff is in, so all we need in reiserfs is
the nesting code.  I'd much rather use the data logging code for this
than port the data logging stuff on top of nesting again.

I've got data logging for 2.4.21-pre in testing now, and once that is
done with I'll get back to 2.5.

-chris

