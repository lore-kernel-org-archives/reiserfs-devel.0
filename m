From: Hans Reiser <reiser@namesys.com>
Subject: Re: Specification for ReiserFS4
Date: Tue, 09 Dec 2003 16:41:09 +0300
Message-ID: <3FD5D0F5.7090208@namesys.com>
References: <200312031822.24679.Cyril.Plisko@MountAll.COM>	<200312090855.16373.Cyril.Plisko@CloverleafComm.COM> <16341.45920.686958.311924@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16341.45920.686958.311924@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Cyril Plisko <Cyril.Plisko@CloverleafComm.COM>, reiserfs-list@namesys.com

Nikita Danilov wrote:

>Cyril Plisko writes:
> > Anyone care to answer ?
> > 
> > On Wednesday 03 December 2003 18:22, Cyril Plisko wrote:
> > > Hello,
> > > 
> > > I am interesting in numbers similar to posted in
> > > http://www.namesys.com/faq.html
> > > There are various characteristic figures for max values
> > > for ReiserFS 3.5 and 3.6.  I cannot find such spec
> > > for ReiserFS4.
> > > 
> > > Can someone help ?
>
>Hello, and sorry for delay.
>
>"Specification" for reiser4:
>
>max number of files user can create on a single file system:  1152921504606846976   (2^60)
>
>max number files a directory can have:                        1152921504606846976   (2^60)
>
>max number sub-directories in a directory:                             4294967294   (2^32 - 2)
>
>max file size[1]:                                            18446744073709551615   (2^64 - 1)
>
>max number links to a file:                                            4294967296   (2^32)
>
>max filesystem size[2]:                                   75557863725914323419136   (2^64 * 4096)
>
>This is for default setup (per-directory limits are determined by
>directory plugin, maximal number of links is determined by stat-data
>plugin, etc.).
>
>[1] Current page cache limitations effectively limit maximal file size
>to 2^(32 + 12) == 2^44 == 17592186044416 bytes, on 32-bit architectures,
>but on-disk format provides for more.
>
>[2] Block IO sub-system currently limits device size to 2^64 * 512 ==
>9444732965739290427392, but on-disk format provides for more.
>
> > > 
> > > Regards,
> > > 	Cyril
> > > 
>
>Nikita.
>
> > > 
> > 
> > -- 
> > /~\  The ASCII Ribbon Campaign
> > \ /    No HTML/RTF in email
> >  X     No Word docs in email
> > / \  Respect for open standards
> > 
>
>
>  
>
Please put the numbers in our v4 documentation somewhere.  Can you say 
more about the 2^32 numbers?  Is it VFS constrained?

-- 
Hans


