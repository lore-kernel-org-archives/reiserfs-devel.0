From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: My Dad suggests a redundant copies plugin
Date: Wed, 26 Oct 2005 12:19:52 -0400
Message-ID: <e692861c0510260919y66ebc19fj570973d211ad2c55@mail.gmail.com>
References: <435DC714.6000505@namesys.com>
	 <e692861c0510260911h33c9e2f0x549223c60ddadaef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0510260911h33c9e2f0x549223c60ddadaef@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 10/25/05, Hans Reiser <reiser@namesys.com> wrote:
> This would not be (at least in theory) useful for RAID devices, but for
> a user with a single disk drive, it might be useful to have a plugin
> that creates two (or N) copies, and tries to allocate the two copies at
> opposite ends of the disk.  Anyone out there still looking for a plugin
> to write?

It would be more important to have redundancy for important filesystem
datastructures first, because if you lose your filesystem it becomes
very difficult to read your data.

With modern high density drives bad blocks have become more common
than disk failures, redundancy makes a lot of sense but the cost of
duplicating every file is simply too great for many applications. The
ability to control the level of redundancy and protection from the
filesystem is becoming increasingly important.

Hans, have you read the Iron filesystems paper
(http://www.cs.wisc.edu/wind/Publications/iron-sosp05.ps) that was
previously cited on this list?  You should at least skim it.
