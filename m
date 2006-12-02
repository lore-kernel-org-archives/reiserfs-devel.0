From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Possible interference between reiser4 and usb-storage?
Date: Sat, 2 Dec 2006 12:15:54 +0100
Message-ID: <194f62550612020315t55a13c40h175845803c8c8775@mail.gmail.com>
References: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
	 <Pine.LNX.4.64.0611250538370.16392@sheep.housecafe.de>
	 <194f62550611250117j30835681o8d824812f60f5dca@mail.gmail.com>
	 <4569CA44.9060907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4569CA44.9060907@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi again,

> I would recommend to use on-the-fly conversion to unix-file plugin. It
> will reduce
> memory usage for incompressible files. You will need to reformat your
> root partition.
> Use "mkfs.reiser4 -o create=ccreg40,compressMode=conv /dev/xxx" to
> enable this.
> But first rebuild kernel with the attached patch. This feature is
> relatively new, so it
> would be better to have a backup of your root partition and update it
> from time to time.

Thanks a lot ... I'll give it a try soon when I'll get my new laptop.
Congratulations to reiser4's stability - I ever encountered a single
stability or data corruption problem.

However lately I deleted about 8 700mb files (mpg) and my laptop was
busy for about 5min. I deleted it using konqueror - do you have an
idea why deleting such large files is that slow?

Thank you in advnace, lg Clemens
