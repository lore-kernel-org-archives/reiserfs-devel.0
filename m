From: Chet Hosey <chet@colo.tr0n.com>
Subject: Re: REISERFS_MAX_NAME and ENAMETOOLONG
Date: Mon, 22 Aug 2005 09:03:37 -0400
Message-ID: <20050822130337.GA10132@sx-hosting.com>
References: <43099E14.7060902@baldauf.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43099E14.7060902@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Aug 22, 2005 at 11:42:44AM +0200, Xu?n Baldauf wrote:
> Hello,
> 
> when downloading something from java.sun.com (e.g. 
> http://javashoplm.sun.com/ECom/docs/Welcome.jsp?StoreId=22&PartDetailId=jdk-1.5.0-doc-oth-JPR&SiteId=JSC&TransactionId=noreg 
> ), very long URLs are encountered. When trying to download using "wget", 
> wget tries to open a file with those long filenames, and fails with 
> ENAMETOOLONG (File name too long).
> 
> I think that the limit is due to the REISERFS_MAX_NAME macro 
> (http://lxr.linux.no/source/include/linux/reiserfs_fs.h?v=2.6.10#L1107), 
> which currently resolves to "255" (which supposedly means 255 bytes).
> 
> Is it safe to change REISERFS_MAX_NAME to something larger, or does this 
> change the disk layout in an unexpected or incompatible way?
> 
> Thanks,
> 
> Xu?n Baldauf.
> 

I'm sure you've investigated this, but you might also consider the -O
option to wget -- it probably isn't quite what you're looking for if you
are fetching multiple files (such as with --mirror), but when fetching
one file at a time it's quite a bit less drastic than recompiling the
kernel and putting extremely long file names on disk.

Chet
