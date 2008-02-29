From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Fri, 29 Feb 2008 16:12:04 +0300
Message-ID: <5c7c368b0802290512k4bc8ae8ka9aadfa0798fc7ca@mail.gmail.com>
References: <200802272135.41599.berny@mclink.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=w2mB1M/llOvMXqgZm/1o/npesjlSn1NKKiNqAQKIwJ8=;
        b=q8Pc/zWN6cwCzg6DevvJxjJ+ugKj/lp3bRyACJOewX0KZ9Zn6Aqu2zA4uQqLdvynmo1tJ0LDA2m03lND9spr3PfR7APi2xuPhsv+AfV+M896iTgYc5/vcRnYmfMkAzxIC4B7qKfx6q1Y0U7FOreG2QJ2aEeeGo43x4uJPEM0qI8=
In-Reply-To: <200802272135.41599.berny@mclink.it>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Wed, Feb 27, 2008 at 11:35 PM, berny(R) <berny@mclink.it> wrote:
> Hi, Edward.

Hello

>  Last week I reformat my Ubuntu 7.10 64bit system to try Reiser4 filesystem
>  (actually I'm using reiserfs 3.6).
>  I put all my partition (even / and except boot) on reiser4 kernel was 2.6.24
>  compiled in the kernel.
>
>  I got strange problems:
>  the first was with netbeans java IDE, when I was compiling in the window on
>  the bottom of the screen I got only garbage (like little square) like when
>  you have a different char set than the good one!
>  After that the java app was working but it was impossible to see compile
>  warnings or errors.

This looks like broken console settings not related to reiser4.
Something similar can happen after trying to read a file which
contains unreadable symbols..

>
>  The second thing that happened was that sometimes my kde 3 desktop became
>  frozen, for example, konqueror window open then click on the cross, the
>  system froze for 10 seconds then the window close and all was normal again.

If system freezes look annoying for you, then I can send an experimental
patch against them.

As per fsync-bound application freezes: there is no any instant remedy
for now except disabling reiser4-specific fsync. Such solution requires
an UPS (unpopular option).

Thanks,
Edward.

>
>  I formatted with standard options and also standard mount options for all the
>  drives and partition.
>
>  My system is a striker extreme board, intel core 2 duo 2.4 4 gb Kingston
>  hiperX ram, 2 barracuda 500 Gb.
>
>  Do you have some suggestions expecially about the java stuff?
>  Now I'm back to reiser 3.6 because I need to work with netbeans!
>
>  Thanks, warm regards.
>  Paolo
>
>
>  -
>  To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
