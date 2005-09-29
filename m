From: Mirko.Klemm@tsg-online.de
Subject: mkreiserfs: Meaning of "fileysteme-size" arg
Date: Thu, 29 Sep 2005 10:48:58 +0200
Message-ID: <OFDC324CB7.8F3C4B72-ONC125708B.002FA965@aral.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

what is the EXACT meaning of the "filesystem-size" command line argument to
mkreiserfs?
Is it the total size the filesystem occupies, i.e. will the filesystem fit
on a partition exactly the size in "filesystem-size", or is it some sort of
net value, to which I have to add some overhead.

Background:
I want to create a filesystem on a disk partition that can be backed up to
a dvd+r just by "dd"-ing an image of the filesystem onto the dvd+r-writer,
and I'd like to make the filesystem exactly the size the dvd+r can hold.
Unfortunately, this exact size cannot be expressed by my hard disk geometry
(i.e. i cannot make a partition exactly that size), so the partition has to
be a bit bigger than the filesystem. Can I create a reiserfs that is
smaller than the partition it is contained in, with the "filesystem-size"
argument,, and will this work reliably?

Thanks,
Mirko

