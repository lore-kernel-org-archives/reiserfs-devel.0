From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 11:20:27 -0400
Message-ID: <1125328828.5544.72.camel@localhost.localdomain>
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
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25700-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431320E5.3030408@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs <reiserfs-list@namesys.com>

On Mon, 2005-08-29 at 10:51 -0400, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Ming Zhang wrote:
> > On Mon, 2005-08-29 at 10:26 -0400, Jeff Mahoney wrote:
> > No. Block size is the declared filesystem blocksize, not the hardware
> > sector size. It must be a power of 2, and 512-8192 bytes. The "standard"
> > filesystem blocksize is 4k. If you've declared your block size as 512
> > bytes (using mkreiserfs -b 512), that would certainly be another source
> > of performance issues.
> > 
> >> so 1 block per bit, thus (blocksize * 8) block per block.
> 
> Exactly.
> 
> >> since that is a newly formatted fs, there is no journal to replay.
> >> because that FS is big with 3.2TB, if bitmap is not continuous on disks,
> >> then the read is like a random read to read around total ~100MB 4K piece
> >> from disk. so this is why it is slow?
> 
> I need to look into this some more, but I suspect it may be related to
> congestion avoidance. The requests don't bind up in waiting for the data
> to come back, but, rather, allocating the request in the first place.
> 
> >> any way to store these bitmap together?
> 
> The "old" reiserfs disk format did exactly that. However, the gain
> realized (if any, see above) at mount time is quickly lost when the
> filesystem can no longer be dynamically expanded/shrunk, and if the
> bitmaps are actually read on-demand, then it causes needless seeks to
> the "bitmap secion."

but anyway the bitmap will not scattered all around the disk rite?

so where i could find a document about this bitmap layout? also detailed
information on whole file system layout?

thanks.

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
> iD8DBQFDEyDlLPWxlyuTD7IRArjZAJoCxQCJ8Qs4AM1OQZEJIhz1BvYwDQCeIRk+
> VvRxXcyH1puW2vq1xDYygL0=
> =FVcM
> -----END PGP SIGNATURE-----

