From: Ookhoi <ookhoi@humilis.net>
Subject: Re: no reiserfs quota in 2.4 yet? 2.4.21-pre4-ac4 says different
Date: Wed, 19 Feb 2003 23:40:25 +0100
Message-ID: <20030219234024.N20771@humilis>
References: <20030217183957.O1284@humilis> <1045504527.2182.415.camel@tiny.suse.com> <20030219134842.GB7138@atrey.karlin.mff.cuni.cz>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030219134842.GB7138@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Chris Mason <mason@suse.com>, ookhoi@humilis.net, reiserfs-list@namesys.com, alan@lxorguk.ukuu.org.uk

Jan Kara wrote (ao):
> > On Mon, 2003-02-17 at 12:39, Ookhoi wrote:
> > > Today I put a new kernel on a server which has reiserfs and needs
> > > quota. I searched for the quota patches (found them in the mail
> > > archive) and saw that they are very old:
> > > 
> > > ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20
> > > 
> > > 3 december 2002. They don't apply to a current kernel. 
> > 
> > Well, 2.4.20 is the current kernel ;-)  Which kernel do you want them
> > against? I've got patches against 2.4.21-preX in testing here, but not
> > against -ac. They should merge against -ac now more easily, but I
> > haven't had time to really test it.
> > 
> > Do you want to try the merge on -ac or would you rather try against
> > 2.4.21-preX
>
> Alan has needed changes to generic quota code already in his patchset
> so probably just leaving out these changes should make everything work
> (but I haven't tested it recently).

You mean, I should use only a few of these?

01-quota-v2-2.4.20.diff
02-nesting-2.4.20.diff
03-reiserfs-quota-23-2.4.20.diff
04-kinoded-8-2.4.20.diff

I'm afraid they don't apply cleanly, though I might just need to try a
bit harder.

OTOH, there must be a reason that Chris _works_ on it ;-)  (eg,
non-trivial)

Anyway, I have the following wishes (yeah, it is not even Christmas!):

o  quota in -ac patches for reiser (like the Configure help already
                                    says ;-)
o  or for -ac patches.
o  updating of the Namesys FAQ on quota patches.
o  peace on earth.

If the people involved can take care of this, I would love to buy them
all a beer or two if they ever come to Amsterdam and if not with too
many at a time. But remember, these are wishes only.

Take care and thanks!!
