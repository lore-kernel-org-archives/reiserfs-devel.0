From: Mat <jackdachef@gmail.com>
Subject: Re: reiser4 inclusion?
Date: Sun, 19 Apr 2009 11:41:04 +0000 (UTC)
Message-ID: <loom.20090419T112851-56@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

>1. Support the R4 fs under the name R4.
>2. Set up a project page or, on the wish of the developement community, 
>a wiki.
>3. Under an other name, which I've choosen and I'm not allowed to name 
>in this mailinglist, I've have even developed another kind of file system.

>The results were:
>To 1.: No echo.

yes please, please support reiser4 since its the only filesystem so far (besides
reiserfs 3.6) being able to deal with lots of my data in a secure and
space-efficient way while keeping the user in mind (synchronous writes while
using dm-devices, not corrupting or zeroing files out, ...) besides that it's
also very gentle towards harddrives (very silent operation and long battery
runtime) and has some kind of basic SSD support already built in due to its
"trees that cache well" from what I understand

>To 2.: No replay.

is there an official wiki yet ? can't it be hosted along with reiser4-patches,
reiser4progs, etc. on the kernel.org servers ?

I know there's some development going on (mainly in Russia ?) but wouldn't it be
more efficient to let others also partake in those efforts (e.g. by posting some
email) and learn from it in order to better understand the filesystem and then
at a later point being able to support and enhance the filesystem ?

>To 3.: I got a kindly "Go away" advice.

I guess that's the freedom the developers and maintainers have ;)
(* there's always the last resort in forking it which isn't the best way since
it won't bundle resources and efforts)

@Edward:

any news on reiser4's status ?

it has come a long way and - I hope - that it will find its way into Linus' tree
(I can't believe how many trouble my few ext3 or ext4-based partitions have
caused me recently. From my understandings reiserfs v3.6 and reiser4 wouldn't
cause that problems (incomplete or corrupt files, data loss, etc.) due to their
design)

Thanks

Mat

