From: Oleg Drokin <green@namesys.com>
Subject: Re: Online Resizing Failure
Date: Mon, 28 Oct 2002 19:26:35 +0300
Message-ID: <20021028192635.A1171@namesys.com>
References: <Pine.GSO.4.33L.0210251403010.28840-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.33L.0210251403010.28840-100000@unix2.cc.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Oct 25, 2002 at 02:10:01PM -0500, Matt Stegman wrote:
> I cannot resize a mounted reiserfs filesystem.  I'm trying to grow a
> reiserfs filesystem on an LVM volume.  I've extended the volume with
> lvextend, and resize_reiserfs -v reports "remount failed: Invalid
> argument."  Looking in dmesg, I see "can't shrink filesystem on-line." I'm
> using kernel 2.4.20-pre10-ac2 on Gentoo Linux, reiserfsprogs 3.6.3. I know
> reisers supports online growing, but I don't know what I'm doing wrong.

resize_reiserfs is sure that you are trying to shrink the FS.
How did you specified new size, can you give us more info on what are you doing,
what commands you given, and other useful info?

Bye,
    Oleg
