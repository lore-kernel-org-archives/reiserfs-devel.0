From: Chris Mason <mason@suse.com>
Subject: Re: no reiserfs quota in 2.4 yet? 2.4.21-pre4-ac4 says different
Date: 19 Feb 2003 20:10:11 -0500
Message-ID: <1045703410.16042.70.camel@tiny.suse.com>
References: <20030217183957.O1284@humilis>
	 <1045504527.2182.415.camel@tiny.suse.com>
	 <20030219134842.GB7138@atrey.karlin.mff.cuni.cz>
	 <20030219234024.N20771@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030219234024.N20771@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ookhoi@humilis.net
Cc: Jan Kara <jack@suse.cz>, reiserfs-list@namesys.com, alan@lxorguk.ukuu.org.uk

On Wed, 2003-02-19 at 17:40, Ookhoi wrote:

> > Alan has needed changes to generic quota code already in his patchset
> > so probably just leaving out these changes should make everything work
> > (but I haven't tested it recently).
> 
> You mean, I should use only a few of these?
> 
> 01-quota-v2-2.4.20.diff

Not this, -ac already has it

> 02-nesting-2.4.20.diff
> 03-reiserfs-quota-23-2.4.20.diff

Or these two, I've got an updated reiserfs-quota patch on top of the
data logging code in testing here, it should apply more cleanly on -ac. 
The big delay right now is I'm trying to fix another latency bug in
data=ordered support, and test the fix for the sd_block count on
symlinks.

> 04-kinoded-8-2.4.20.diff
> 
> I'm afraid they don't apply cleanly, though I might just need to try a
> bit harder.
> 
> OTOH, there must be a reason that Chris _works_ on it ;-)  (eg,
> non-trivial)
> 
> Anyway, I have the following wishes (yeah, it is not even Christmas!):
> 
> o  quota in -ac patches for reiser (like the Configure help already
>                                     says ;-)

I doubt I'll send it to Alan, keeping up with vanilla and the suse
kernels is hard enough ;-)  If someone wants to actively work with me on
maintaining them in the ac tree, drop me a private message and we should
be able to work something out.

-chris


