From: Oleg Drokin <green@namesys.com>
Subject: Re: % of filesystem using tails/tail unpacking (shred related)
Date: Tue, 29 Oct 2002 09:10:41 +0300
Message-ID: <20021029091041.A5105@namesys.com>
References: <HDEFILEPHCPLCAGPLCEMKEMFDFAA.icycle@charter.net> <15805.2440.413201.310382@laputa.namesys.com> <200210282120.g9SLKvgn005200@turing-police.cc.vt.edu> <3DBDBC81.4040703@charter.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DBDBC81.4040703@charter.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Russ <icycle@charter.net>
Cc: Valdis.Kletnieks@vt.edu, Nikita Danilov <Nikita@namesys.com>, Reiserfs-List <reiserfs-list@namesys.com>

Hello!

On Mon, Oct 28, 2002 at 05:38:57PM -0500, Brett Russ wrote:
> a) shred will work reliably on all new files created on a filesystem 
> mounted with tail packing disabled

Yes. Also in reiserfs case (2.4 kernel in current state) tail is packed
on close, if file created was bigger than 16K (with newe cod it is 
switchable and can be also 4K), tail is never packed for such a file.
Actually the rule is more complex than that, see reiserfs_fs.h,
STORE_TAIL_IN_UNFM

> b) to deal with filesystems already tail packed, shredding knowledge 
> would need to be added to the unpack ioctl BUT there is no way to 
> determine where else the tails have lived on disk prior to any rebalancing.

True. If ever there were any tails at all.
Same stuff applies to a case where file was read into memory,
modified a little bit and then written back to disk, truncating or
removing original file first. On any fs. Lots of editors behave like this
and thus making shred not very effecrive.

> Which leads to:
> c) there is no reliable way to shred anything that has been tail packed.

True. But on reiserfs there certain kind of files (i.e. longer than 16K)
that are never packed.
Also with introduction of data journaling, in data journaling mode the data
removed still will be in journal for some time.

Bye,
    Oleg
