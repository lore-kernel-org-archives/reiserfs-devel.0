From: Tomasz Chmielewski <mangoo@mch.one.pl>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 10:53:58 +0200
Message-ID: <432D2B26.1070909@mch.one.pl>
References: <432AFB44.9060707@namesys.com>	 <200509171356.14497.vda@ilport.com.ua>	 <200509171415.50454.vda@ilport.com.ua>	 <200509180934.50789.chriswhite@gentoo.org> <194f625505091801231f54980@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f625505091801231f54980@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linuxhippy@gmail.com
Cc: reiserfs-list@namesys.com

Clemens Eisserer schrieb:
> The longer I read discussions about the inclusion of reiser4 into the
> kernel the more I think the whole discussion has to do with personal
> oppinions, not with technical problems or limitations that should be
> adressed.
> Anybody who is a ext3 fan seems to find his own reasons why reaiser4
> should stay away - thats real competition - could be fud-people payed
> by redhat how seem to force anybody to use ext3 (thanks for fc4
> bullshit) ;-)
> I have heard so many reasons why reiser4 should not be in kernel,
> however nobody seems to think about why it should be included. Its the
> only really activly developed linux vs with features most (all) other
> fs lack and it has a great ability for improvements through plugins.

compression plugin would save me (not only me I believe) lots of time 
and a couple of disks...

and the only other Linux fs with write mode that has compression is 
patched ext2 (which is also not included in the kernel, and has some 
problems) - well, there is also jffs2 with limits of 4 GB partition, so 
not really useful for storing bigger amounts of data.

I actually even considered using NTFS on Linux servers, with some 
commercial product providing NTFS with all features (write, compression 
etc.) - crazy, isn't it?

-- 
Tomek
http://wpkg.org
Software deployment and upgrades with Samba
