From: Edward Shushkin <edward@namesys.com>
Subject: Re: Several questions about encrypted filesystem
Date: Wed, 18 Jun 2003 19:20:29 +0400
Sender: edward
Message-ID: <3EF0833D.EF03FB90@namesys.com>
References: <3AA03342E913FA4BA6D8BD0732BFC74B020F443A@pdsmsx402.pd.intel.com>
		 <3EEEFE60.4C86EEE6@namesys.com>  <3EEF3B81.9060709@namesys.com> <1055921837.2026.25.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz-Josef Claes <heinz-josef.claes@bundestag.de>
Cc: Hans Reiser <reiser@namesys.com>, "Zhao, Forrest" <forrest.zhao@intel.com>, reiserfs-list@namesys.com

Heinz-Josef Claes wrote:
> 
> Am Die, 2003-06-17 um 18.02 schrieb Hans Reiser:
> > V4 performs individual file encryption and compression, and it performs
> > it at flush to disk time rather than at every write for performance reasons.
> >
> > We are going to move reiserfs gradually more and more towards encryption
> > based security, it is especially important for distributed file systems.
> >
> > How we integrate into the PKI is still being designed, right now we are
> > working on making encryption and compression work in the lower layers,
> > and later we will look at how processes should inherit keys from each
> > other, etc.
> 
> I'm really not a specialist in encryption. If it should be really useful
> in a "normal" office evironment it should be possible to handle the
> following on the lokal and on the remote filesystem:
> - mounting different filesystems via NFS
> - mounting different filesystems via SMB (Samba) from Windows
> - sharing group filesystems between different users
> - combination with unix permissions and ACLs (I don't know if this makes
> sense)
> 
> Pershaps this is possible with kerberos or something like this!?
> *But* all of the above does encrypt on the network.

Actually kerberos is to detect transfer errors of big packets (it uses
a special chaining mode which smears a whole packet during decryption
if error occurs). This feature is incompatible with file system purpose
(to be precisely, with the purpose of its default plugins) which is
required to not spend a lot of resources when you ask to read 2 bytes
from any offset. However we'll support chaining, but it should going
on in very restricted volumes (< 32-128K). For other special plugins 
everything is possible (for instance large crypto-logs where chaining
is going per whole file: each string is encrypted by its own key generated
from previous one by special rules, etc..)

Edward.


> 
> I've heard about (commercial) software which does all of this on the
> client side (on windows).
> Do you have any ideas how to solve or integrate these problems in the
> (lokal?) solution or is this behind your focus?
> 
> Regards,
> Heinz-Josef Claes
