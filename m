From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Possible interference between reiser4 and usb-storage?
Date: Sat, 2 Dec 2006 15:59:06 +0100
Message-ID: <194f62550612020659h10cf0e8aj2cc0a16778382901@mail.gmail.com>
References: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
	 <Pine.LNX.4.64.0611250538370.16392@sheep.housecafe.de>
	 <194f62550611250117j30835681o8d824812f60f5dca@mail.gmail.com>
	 <4569CA44.9060907@namesys.com>
	 <194f62550612020315t55a13c40h175845803c8c8775@mail.gmail.com>
	 <45718F51.1080606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45718F51.1080606@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Thanks a lot for the detailed explanation.

> Current conversion policy (convert to extent, if first 64K are
> incompressible)
> allows to properly handle ~50% of all mpegs. I hope it can be increased
> up to
> 70-80% using only cosmetic changes. However, other problems you described
> (a lot of HD seeks, slow directory listing) should disappear with the
> _current_
> conversion stuff.

1.) Ok, you convinced me ... I'll try it out very soon. Is the patch
you mentioned against my patched 2.6.19rc4-mm1 kernel which has
already been patched by a patch you posted on the list about 1 month
ago when I asked about compression?
I'll do some timings before and let you know how well it does.

2.) Is there a way to find out how much a file / files have/has been
compression.
If I ask konqueror how large all sub-stuff of a directory is, is this
the compressed size or the size the uncompressed files have?

Thanks a lot for all your patience, lg Clemens
