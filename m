From: Oleg Drokin <green@namesys.com>
Subject: Re: unable to mount / rebuild-tree
Date: Sun, 5 May 2002 18:09:58 +0400
Message-ID: <20020505180958.A13260@namesys.com>
References: <003f01c1f423$7f037410$6400a8c0@jerez>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <003f01c1f423$7f037410$6400a8c0@jerez>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bodo Buerger <bodo.buerger@gmx.de>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, May 05, 2002 at 12:56:10PM +0200, Bodo Buerger wrote:

> <4>Checking ReiserFS transaction log (device 16:01) ...
> <4>hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> <4>hdc: read_intr: error=0x40 { UncorrectableError }, LBAsect=65744, sector=65681
> <4>end_request: I/O error, dev 16:01 (hdc), sector 65681

These messages are clear sign of hardware error (failed hard drive).
Broken hardware is dealt with based on http://namesys.com/support.html terms
(be NAMESYS, that's it).

Bye,
    Oleg
