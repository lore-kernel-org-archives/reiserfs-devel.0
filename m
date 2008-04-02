From: "jyotiv" <jyotiv@tataelxsi.co.in>
Subject: RE: bad block management
Date: Wed, 2 Apr 2008 10:20:13 +0530
Message-ID: <000801c8947d$0a28fba0$c755a8c0@jyotis>
References: <47F2B306.6060202@gmail.com>
Reply-To: <jyotiv@tataelxsi.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47F2B306.6060202@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Edward Shishkin' <edward.shishkin@gmail.com>, 'Jeff Mahoney' <jeffm@suse.com>
Cc: ric@emc.com, 'Christian Kujau' <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org

Thanks a lot.

Modern disk drives manages the bad blocks(sectors).

We are keeping in mind that hard drive, the  user is using may not be
modern.
In such case this bad block management at file system level is help ful.

And for modern hard drives it is helpful only after reserved sector for
remapping are exhasted.


UDF what we have implemented is for hard disk with high capacity.
Thank you every body.

Rgrds,
Kgp


-----Original Message-----
From: Edward Shishkin [mailto:edward.shishkin@gmail.com]
Sent: Wednesday, April 02, 2008 3:41 AM
To: Jeff Mahoney
Cc: ric@emc.com; Christian Kujau; kgp; reiserfs-devel@vger.kernel.org
Subject: Re: bad block management


Jeff Mahoney wrote:

> Ric Wheeler wrote:
>
> >Christian Kujau wrote:
>
> >>On Mon, 31 Mar 2008, kgp wrote:
> >>
> >>>How ReiserFS manages bad blocks?
> >>
> >>Is reiserfsck's --badblocks option helpful?
> >>
> >>>If it is not supporting bad block management, plz tell me the
> >>>approches we
> >>>can use to implement bad block management in any file system. I am
> >>>implementing bad block manager for UDF. I want some inputs
> >>
> >>Doesn't "Spared UDF" already provide some kind of bad block management?
> >>
> >>C.
>
> >I am not sure what you want to do with bad block management.
>
> >With most modern disk drives, they will remap bad disk sectors
> >dynamically for you so the file system layer can stay out of the bad
> >block mapping business entirely.
>
>
> He's asking about UDF, though, so I'd imagine he's talking about optical
> media. It's even cheaper than disk though, so I guess I don't see the
> benefit.
>
> Reiserfs handles bad blocks by allocating the blocks input as "known
> bad" to special file that's inaccessible. It does _not_ do this
> automatically, and reiserfsck/mkreiserfs must be passed a list of blocks
> to allocate to that file. It also doesn't recover files that have been
> corrupted to the block failure.


Here are the instructions:
http://chichkin_i.zelnet.ru/bad-block-handling.html

>
> Ric's right about disk drives, though. They'll remap the bad sectors
> automatically at the hardware level. When you start to see bad sectors
> at the file system level, it means that the sectors reserved for
> remapping have been exhausted and you should replace the disk.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.

Contact your Administrator for further information.

