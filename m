From: Matt Stegman <matts@ksu.edu>
Subject: Re: Online Resizing Failure
Date: Mon, 28 Oct 2002 11:02:49 -0600 (CST)
Message-ID: <Pine.GSO.4.33L.0210281040001.29849-100000@unix2.cc.ksu.edu>
References: <20021028192635.A1171@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021028192635.A1171@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 28 Oct 2002, Oleg Drokin wrote:
> resize_reiserfs is sure that you are trying to shrink the FS.
> How did you specified new size, can you give us more info on what are you doing,
> what commands you given, and other useful info?

Well, after looking at it again, it looks like it succeeded.  `df -k`
reports the new size, and the kernel message "can't shrink filesystem
on-line" is from a _second_ try to resize the filesystem; after it was
successfully resized the first time.

What fooled me was that resize_reiserfs didn't give any output at all for
online growing, while growing offline produces some output - I guess it's
just a summary of the fs blocks.  Why doesn't online resizing produce any
output?

-- 
      -Matt Stegman



