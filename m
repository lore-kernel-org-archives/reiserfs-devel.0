From: Chris Mason <mason@suse.com>
Subject: Re: new data logging patches available
Date: 20 May 2003 11:00:09 -0400
Message-ID: <1053442808.9507.48.camel@tiny.suse.com>
References: <1052400138.14612.483.camel@tiny.suse.com>
	 <20030512113348.GA4423@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030512113348.GA4423@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 2003-05-12 at 07:33, Oleg Drokin wrote:
> Hello!
> 
> On Thu, May 08, 2003 at 09:22:19AM -0400, Chris Mason wrote:
> 
> > These include Oleg Drokin's merge with 2.4.21-rc1 (thanks Oleg!), and
> > they no longer change fs/super.c:sync_supers().  I believe things are
> > now clean enough for me to start submitting for 2.4.22-pre once it
> > starts.
> 
> BTW, what have happened to your work on porting this stuff to 2.5 and the whole idea
> of feeding this stuff into 2.5 first?

The part I wanted in 2.5 first was the sync supers change.  For now I'll
be happy if I can get the whole thing (without sync supers) in 2.4, so I
can concentrate more on 2.5 code.

-chris


