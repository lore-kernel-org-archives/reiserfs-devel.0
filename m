From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: mkreiserfs: Meaning of "fileysteme-size" arg
Date: Thu, 29 Sep 2005 11:47:04 +0200
Message-ID: <433BB818.4050204@muenning.com>
References: <OFDC324CB7.8F3C4B72-ONC125708B.002FA965@aral.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <OFDC324CB7.8F3C4B72-ONC125708B.002FA965@aral.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!

Mirko.Klemm@tsg-online.de wrote:
> Hi,
> 
> what is the EXACT meaning of the "filesystem-size" command line argument to
> mkreiserfs?

according to the man page:

filesystem-size is the size in blocks of the filesystem. If omitted,
mkreiserfs will automatically set it.

> Is it the total size the filesystem occupies, i.e. will the filesystem fit
> on a partition exactly the size in "filesystem-size", or is it some sort of
> net value, to which I have to add some overhead.

In my understanding and experience it is the size you want to occupy
with the fs. This would be the size of the partition you want the fs to
fit in. If you don't specify it mkreiserfs will query the size itself.

> Background:
> I want to create a filesystem on a disk partition that can be backed up to
> a dvd+r just by "dd"-ing an image of the filesystem onto the dvd+r-writer,
> and I'd like to make the filesystem exactly the size the dvd+r can hold.
> Unfortunately, this exact size cannot be expressed by my hard disk geometry
> (i.e. i cannot make a partition exactly that size), so the partition has to
> be a bit bigger than the filesystem. Can I create a reiserfs that is
> smaller than the partition it is contained in, with the "filesystem-size"
> argument,, and will this work reliably?

I assume you want to make it like this to be able to mount the DVD later
for accessing the backup files directly (no untarring).

The idea is nice but maybe there are better ways. For the reliability -
if you can umount (or remount ro) the partition before backing it up it
would work reliable. Otherwise you will be saving an unclean partition
with possible corruptions as journal and fs contents may change
independently while you are storing.

Why using reiserfs on a read only medium? The only sense I see is if you
want to keep the positions of the data on the medium after restoring by
dd-ing it back to your partition. Some software copy protections need
this. Otherwise you would be wasting media for the journal. Creating a
new fs and restoring the files is only a little bit more effort but you
get allways a clean fs.

If your concern is to store files >2GB which isofs can't, use UDF. The
dvd+rw-tools can do this on the fly so doing this is as easy as dd-ing
the partition to the DVD.

Do you need to have a partition for your fs? Arbitrary sizes are
possible if you create an image file and store your fs there. You can
mount it using the loopback device. Otherwise if you use a partition
bigger than the fs you need to specify fs size on the dd command as
otherwise dd will transfer the size of the partition, not the size of
the (smaller) fs.

I hope I could help.
Konstantin
