From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Thu, 27 Feb 2003 09:13:24 +0300
Message-ID: <20030227091324.B28643@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1> <200302261914.29475.vitaly@namesys.com> <9837895781.20030227004922@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <9837895781.20030227004922@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Feb 27, 2003 at 12:49:22AM +0100, Anders Widman wrote:
> > tests shown that almost all the time was spent on reading bitmap blocks.
> > And the same reading is done at mount time actually.
>   The   time  it  takes  to fsck a volume is probably only annoying on
>   large arrays of disks running LVM or spanned disk setup. Would it be
>   possible to read bitmaps from all physical drives at the same time?

Certain non-trivial amount of work is need to be put into "parallel" fsck then.

I have idea of a "hack" that might work, though ;)
fsck -a may not close the device until it gets mounted (or some timeout passed).
Then mounting will get bitmaps out of the cache or at least I hope so.
Need to do some experiments.

Bye,
    Oleg
