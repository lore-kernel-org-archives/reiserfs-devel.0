From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 31 Mar 2003 18:35:36 +0200
Message-ID: <20030331163536.GS8452@hvs.envisage.co.za>
References: <200303282026.23543.phma@webjockey.net> <3E88300C.22B54FD7@namesys.com> <20030331133618.GO8452@hvs.envisage.co.za> <200303310854.21695.phma@webjockey.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303310854.21695.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

On Mon, Mar 31, 2003 at 08:54:21AM -0500, Pierre Abbat wrote:
> On Monday 31 March 2003 08:36, Hendrik Visage wrote:
> > The question that should be answered:
> >
> >  Are the design suppose to withstand scrutiny from people like the NSA
> > and other crypto gurus, or just for the mom-a-pop-shops ?
> 
> As I proposed it, it was not meant to withstand scrutiny from anyone. It was 
> meant to be modified by people who know more about kernel and ReiserFS 
> internals than I do. What's your current proposal for keying the encryption?

/dev/random for the paranoid, /dev/urandom for the lesser paranoid

Each file would have a minimum 64bit (For a starter and speed
on <64bit CPUs 32 bit with the top 64bits zeroed and to allow
future 64bit operations) KeyID.

The optimization to it would be to create access groups, and then those
files in the same (sub*)directory & access group could share the same keyID,
if the user/operator so desire (Some would prefer the slowness to the added 
security of the files not sharing the same "guesable" encryption key, while
others would only want to prevent disk scraping from showing something usable).

To make this plugin/future prove, I'd then requested the encryption key
from another process/kernel/module/etc. with at least the minimum tuple
<mount-point,operation[3],KeyID[1a]> or for more expressive information
<mount-point,operation[3],directory,file,UID,GID,KeyID[1a]>.
The data returned from the key database would be
<keyID[1b],EncryptionKey,EncryptionAlgorithm,CryptoOptions[2]>

KeyID should be a globally unique key coming from the key database for recovery 
 purposes in cases the other fields aren't the same anymore, ie. recovering to a
 seperate machine different UIDs etc.)
  [1a]: Would be Zero for an initial/new file
  [1b]: If 1a is zeroed, would be filled with a unique key from key database.

Note [2]: Something in the back of my head tells me that it might just be a
 good idea to add  the facility to provide extra options to the encryption
 or compression algorithm, ie. optimize for size/speed, ie. big files, or
 files on removable devices like USB keydrives

Note [3]: operation ie. create,new, read, write, append, change, rename etc.
 This might look superflous, but if the operator decided on a asymetrical
 encryption method, the read/write requests would yield different keys.

This way I believe the database for the encryption key would then handle the
sharing/management of the keys in whichever way the user/operator would like
to do it, and even do policing of who has access and who doesn't.

The encryption engine I would envisage would then be fed the data and the
encryption key, and the FS would write out the results.

this way we have the following features:

 1) The operator (via key database) can set the policies per file/directory
 2) the key database handle the sharing of keys per file, per directory etc.
 3) The key database would handle the encryption of keys based on certificates
 4) The keying algorithm/methods are outside of the FS.

I believe there would be optimizations to the above, but it would move the
implement away from the FS to allow the changes to the key/encryption
implementations to not impact the FS interface etc.

Hendrik
