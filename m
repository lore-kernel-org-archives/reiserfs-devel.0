From: Oleg Drokin <green@namesys.com>
Subject: Re: no reiserfs quota in 2.4 yet? 2.4.21-pre4-ac4 says different
Date: Thu, 20 Feb 2003 14:44:15 +0300
Message-ID: <20030220144415.A12418@namesys.com>
References: <20030217183957.O1284@humilis> <1045504527.2182.415.camel@tiny.suse.com> <20030219134842.GB7138@atrey.karlin.mff.cuni.cz> <20030219234024.N20771@humilis> <1045703410.16042.70.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1045703410.16042.70.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: ookhoi@humilis.net, Jan Kara <jack@suse.cz>, reiserfs-list@namesys.com, reiser@namesys.com

Hello!

On Wed, Feb 19, 2003 at 08:10:11PM -0500, Chris Mason wrote:
> > > Alan has needed changes to generic quota code already in his patchset
> > > so probably just leaving out these changes should make everything work
> > > (but I haven't tested it recently).
> > You mean, I should use only a few of these?
> > 01-quota-v2-2.4.20.diff
> Not this, -ac already has it

> > o  quota in -ac patches for reiser (like the Configure help already
> >                                     says ;-)
> I doubt I'll send it to Alan, keeping up with vanilla and the suse
> kernels is hard enough ;-)  If someone wants to actively work with me on
> maintaining them in the ac tree, drop me a private message and we should
> be able to work something out.

I think if Hans would agree to that idea, I can do this.
After all - we are interested to have working reiserfs quota support
in RedHat's default kernels. And those are largely based on -ac patches.
Hans?

Bye,
    Oleg
