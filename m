From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 11:37:29 -0400
Message-ID: <1125329849.5544.75.camel@localhost.localdomain>
References: <1125074717.5549.44.camel@localhost.localdomain>
	 <430F4B91.7030909@namesys.com>
	 <1125076138.5549.65.camel@localhost.localdomain>
	 <1125076558.5549.72.camel@localhost.localdomain>
	 <430F5226.50701@namesys.com>
	 <1125080213.5549.100.camel@localhost.localdomain>
	 <4310BF35.3060603@suse.com> <1125183208.5569.3.camel@localhost.localdomain>
	 <4310FEC1.5020600@suse.com>
	 <1125243608.5544.18.camel@localhost.localdomain>
	 <4312060D.8020904@suse.com>
	 <1125319151.5544.16.camel@localhost.localdomain>
	 <43131B2B.8020406@suse.com>
	 <1125326490.5544.56.camel@localhost.localdomain>
	 <431320E5.3030408@suse.com>
	 <1125328828.5544.72.camel@localhost.localdomain>
	 <43132999.5020501@suse.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43132999.5020501@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

On Mon, 2005-08-29 at 11:28 -0400, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Ming Zhang wrote:
> >>>any way to store these bitmap together?
> > The "old" reiserfs disk format did exactly that. However, the gain
> > realized (if any, see above) at mount time is quickly lost when the
> > filesystem can no longer be dynamically expanded/shrunk, and if the
> > bitmaps are actually read on-demand, then it causes needless seeks to
> > the "bitmap secion."
> > 
> >> but anyway the bitmap will not scattered all around the disk rite?
> 
> If they were grouped together, no. As I said, though, there are other
> reasons not to do that.
> 
> >> so where i could find a document about this bitmap layout? also detailed
> >> information on whole file system layout?
> 
> Since Reiser4 became the focus of Namesys development, Reiser3
> information has been somewhat difficult to find on the web site. It's
> possible to find it using archive.org, however.
> 
> Hans - would you consider restoring reiser3 information to the namesys
> web site?

V4 information is great as well. but the namesys.com does not have
detailed info.

ming

> 
> - -Jeff
> 
> - --
> Jeff Mahoney
> SuSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.0 (GNU/Linux)
> 
> iD8DBQFDEymZLPWxlyuTD7IRAv5wAJ9coGB6bChWSLyK1x7lB1LF2E4mIwCfUsEN
> 4nZnXzED8ytA5jiTkv0LbcE=
> =Tocq
> -----END PGP SIGNATURE-----

