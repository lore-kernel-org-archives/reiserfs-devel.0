From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 31 Mar 2003 23:31:04 +0200
Message-ID: <20030331213104.GZ8452@hvs.envisage.co.za>
References: <200303282026.23543.phma@webjockey.net> <200303310854.21695.phma@webjockey.net> <20030331163536.GS8452@hvs.envisage.co.za> <200303311511.40537.phma@webjockey.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303311511.40537.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

On Mon, Mar 31, 2003 at 03:11:40PM -0500, Pierre Abbat wrote:
> On Monday 31 March 2003 11:35, Hendrik Visage wrote:
> > On Mon, Mar 31, 2003 at 08:54:21AM -0500, Pierre Abbat wrote:
> > > On Monday 31 March 2003 08:36, Hendrik Visage wrote:
> > > > The question that should be answered:
> > > >
> > > >  Are the design suppose to withstand scrutiny from people like the NSA
> > > > and other crypto gurus, or just for the mom-a-pop-shops ?
> > >
> > > As I proposed it, it was not meant to withstand scrutiny from anyone. It
> > > was meant to be modified by people who know more about kernel and
> > > ReiserFS internals than I do. What's your current proposal for keying the
> > > encryption?
> >
> > /dev/random for the paranoid, /dev/urandom for the lesser paranoid
> >
> > Each file would have a minimum 64bit (For a starter and speed
> > on <64bit CPUs 32 bit with the top 64bits zeroed and to allow
> > future 64bit operations) KeyID.
> 
> "32 bit with the top 64bits zeroed" is nonsense. I assume you mean "64 bits 
> with the top 32 zeroed". There is no point in doing this, as it's a key ID, 
> not a key. Use the full 64 bits.

Correct. It'll be for speed purposes on 32bit environments until
the need is there for bigger space (ie more than 2^32 files/directories
encrypted/mangled) :(

> > The optimization to it would be to create access groups, and then those
> > files in the same (sub*)directory & access group could share the same
> > keyID, if the user/operator so desire (Some would prefer the slowness to
> > the added security of the files not sharing the same "guesable" encryption
> > key, while others would only want to prevent disk scraping from showing
> > something usable).
> 
> An access group is a group of what?

The specifics should be the key database/engine's responsibility
to define it more precisely, but my initial idea was where two or more
files have the same users having access to these files, these 
users would form an accessgroup.

> > To make this plugin/future prove, I'd then requested the encryption key
> > from another process/kernel/module/etc. with at least the minimum tuple
> > <mount-point,operation[3],KeyID[1a]> or for more expressive information
> > <mount-point,operation[3],directory,file,UID,GID,KeyID[1a]>.
> > The data returned from the key database would be
> > <keyID[1b],EncryptionKey,EncryptionAlgorithm,CryptoOptions[2]>
> 
> You need to add the PID to the tuple used to ask for the key. That way a 
> process and its children can access a file, but other processes running with 
> the same UID cannot. This is necessary for trusted encrypted backup.

Agreed.

However if the key database/engine doesn't have access to an
already decrypted key, then it would return an error. That way the backups
would only be able to copy the file verbatim (ie. un-decryptable) to the backup
medium. Ie. the backups run while the user haven't logged in to enable
decryption. Or am I missing the definition of "trusted encrypted backups"?

> What does "To make this plugin/future prove" mean?

To not be limited by current design for future enhancements or needs.

Hmmm... made me think: The are a bit of information leakage in my data above,
as it assumes the filenames are unencrypted.
However, that could be fixed with the following:
Request:
<mount-point,operation[3],directory,file[4],PID,UID,GID,KeyID[1a]>

The answer:
<keyID[1b],FileName[4]EncryptionKey,EncryptionAlgorithm,CryptoOptions[2]>

Note[4]: The key engine/database might want filenames to be mangled too.
 The request for a new file would be the unmangled, with the response being
 the mangled filename. The reverse would be the case in directory accesses etc.

This could be used for directory names too, thus the only data available to
the attacker (excluding the key engine) would be the mangled names and the
place on the filesystem the data is.

Hendrik
