From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 31 Mar 2003 15:11:40 -0500
Message-ID: <200303311511.40537.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200303310854.21695.phma@webjockey.net> <20030331163536.GS8452@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331163536.GS8452@hvs.envisage.co.za>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 31 March 2003 11:35, Hendrik Visage wrote:
> On Mon, Mar 31, 2003 at 08:54:21AM -0500, Pierre Abbat wrote:
> > On Monday 31 March 2003 08:36, Hendrik Visage wrote:
> > > The question that should be answered:
> > >
> > >  Are the design suppose to withstand scrutiny from people like the NSA
> > > and other crypto gurus, or just for the mom-a-pop-shops ?
> >
> > As I proposed it, it was not meant to withstand scrutiny from anyone. It
> > was meant to be modified by people who know more about kernel and
> > ReiserFS internals than I do. What's your current proposal for keying the
> > encryption?
>
> /dev/random for the paranoid, /dev/urandom for the lesser paranoid
>
> Each file would have a minimum 64bit (For a starter and speed
> on <64bit CPUs 32 bit with the top 64bits zeroed and to allow
> future 64bit operations) KeyID.

"32 bit with the top 64bits zeroed" is nonsense. I assume you mean "64 bits 
with the top 32 zeroed". There is no point in doing this, as it's a key ID, 
not a key. Use the full 64 bits.

> The optimization to it would be to create access groups, and then those
> files in the same (sub*)directory & access group could share the same
> keyID, if the user/operator so desire (Some would prefer the slowness to
> the added security of the files not sharing the same "guesable" encryption
> key, while others would only want to prevent disk scraping from showing
> something usable).

An access group is a group of what?

> To make this plugin/future prove, I'd then requested the encryption key
> from another process/kernel/module/etc. with at least the minimum tuple
> <mount-point,operation[3],KeyID[1a]> or for more expressive information
> <mount-point,operation[3],directory,file,UID,GID,KeyID[1a]>.
> The data returned from the key database would be
> <keyID[1b],EncryptionKey,EncryptionAlgorithm,CryptoOptions[2]>

You need to add the PID to the tuple used to ask for the key. That way a 
process and its children can access a file, but other processes running with 
the same UID cannot. This is necessary for trusted encrypted backup.

What does "To make this plugin/future prove" mean?

> KeyID should be a globally unique key coming from the key database for
> recovery purposes in cases the other fields aren't the same anymore, ie.
> recovering to a seperate machine different UIDs etc.)
>   [1a]: Would be Zero for an initial/new file
>   [1b]: If 1a is zeroed, would be filled with a unique key from key
> database.
>
> Note [2]: Something in the back of my head tells me that it might just be a
>  good idea to add  the facility to provide extra options to the encryption
>  or compression algorithm, ie. optimize for size/speed, ie. big files, or
>  files on removable devices like USB keydrives

or the cryptographic mode, e.g. ECB and no compression for mixrand.bin, CBC 
and bzip2 for a pbm file rarely written to.

