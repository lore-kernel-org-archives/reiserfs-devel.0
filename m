From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Cannot open root device
Date: Mon, 3 May 2004 16:09:14 +0300
Message-ID: <200405031609.14379.rmeijer@internet.gr>
References: <Pine.LNX.4.33.0405022125330.1672-100000@bi165.wilkes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0405022125330.1672-100000@bi165.wilkes.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon 3 May 2004 15:42, John Wilkes wrote:

> Here's where it gets weird: I booted the Rescue system on the
> installation CD, and from there I ran reiserfsck, which reported no
> inconsistecies.  I can mount /dev/hda3 and look around; everything
> seems to be there.  But when I try to boot a system that wants hda3 as
> its root, I get a kernel panic.

Maybe it's not a ReiserFS problem but a LILO problem?

Could you try booting with the "root=/dev/hda3" boot option?

What does your lilo.conf look like?


Ray
