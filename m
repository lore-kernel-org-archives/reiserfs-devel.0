From: Chris Mason <mason@suse.com>
Subject: Re: production use of reiserfs
Date: Mon, 01 Dec 2003 08:33:43 -0500
Message-ID: <1070285623.12809.6.camel@tiny.suse.com>
References: <200311280846.12697.ivan@t1.unisoftbg.com>
	 <16327.6650.487369.786012@laputa.namesys.com>
	 <200311281242.18139.ivan@t1.unisoftbg.com>
	 <16327.13886.709901.444317@laputa.namesys.com>
	 <3FC6DB90.7080408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FC6DB90.7080408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@namesys.com>, ivan <ivan@t1.unisoftbg.com>, reiserfs-list@namesys.com

On Fri, 2003-11-28 at 00:22, Hans Reiser wrote:
> >
> this is not likely to show any differences, sources of bugs are likely 
> to be outside reiserfs.
> 
> I can tell you that I don't particularly trust reiserfs on redhat 
> kernels because they don't apply reiserfs bug fix patches and generally 
> don't mind breaking reiserfs.  Please download  the latest official 
> kernel if you want to be sure to have all bugfixes we have made.  The 
> latest official kernel is very solid for reiserfs, as is the suse kernel 
> (excepting the extended attributes patch SuSE wrote which you can 
> disable in the kernel configuration).  This particular kernel you have 
> might be reasonably stable because 2.4.20 was reasonably stable for us, 
> but as I said the latest official kernel generates no bug reports on 
> filesystems created from scratch on it.   We would investigate and fix 
> your bug report for free except that RedHat will not apply it if we 
> generate a patch, so we would only do it for a fee.

Hans, please send along details for the xattr bugs you think are in the
suse kernel.  We have no open bug reports for them, and they work pretty
well.

-chris


