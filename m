From: Heinz-Josef Claes <heinz-josef.claes@bundestag.de>
Subject: Re: Several questions about encrypted filesystem
Date: 18 Jun 2003 09:37:18 +0200
Message-ID: <1055921837.2026.25.camel@wusel.schnulli.de>
References: <3AA03342E913FA4BA6D8BD0732BFC74B020F443A@pdsmsx402.pd.intel.com>
	 <3EEEFE60.4C86EEE6@namesys.com>  <3EEF3B81.9060709@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EEF3B81.9060709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Edward Shushkin <edward@namesys.com>, "Zhao, Forrest" <forrest.zhao@intel.com>, reiserfs-list@namesys.com

Am Die, 2003-06-17 um 18.02 schrieb Hans Reiser:
> V4 performs individual file encryption and compression, and it performs 
> it at flush to disk time rather than at every write for performance reasons.
> 
> We are going to move reiserfs gradually more and more towards encryption 
> based security, it is especially important for distributed file systems.
> 
> How we integrate into the PKI is still being designed, right now we are 
> working on making encryption and compression work in the lower layers, 
> and later we will look at how processes should inherit keys from each 
> other, etc.

I'm really not a specialist in encryption. If it should be really useful
in a "normal" office evironment it should be possible to handle the
following on the lokal and on the remote filesystem:
- mounting different filesystems via NFS
- mounting different filesystems via SMB (Samba) from Windows
- sharing group filesystems between different users
- combination with unix permissions and ACLs (I don't know if this makes
sense)

Pershaps this is possible with kerberos or something like this!?
*But* all of the above does encrypt on the network.

I've heard about (commercial) software which does all of this on the
client side (on windows).
Do you have any ideas how to solve or integrate these problems in the
(lokal?) solution or is this behind your focus?

Regards,
Heinz-Josef Claes


