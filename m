From: Anders Widman <andewid@tnonline.net>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Thu, 27 Feb 2003 00:49:22 +0100
Message-ID: <9837895781.20030227004922@tnonline.net>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1>
 <200302261914.29475.vitaly@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12948-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302261914.29475.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hi,
> tests shown that almost all the time was spent on reading bitmap blocks.
> And the same reading is done at mount time actually.

  The   time  it  takes  to fsck a volume is probably only annoying on
  large arrays of disks running LVM or spanned disk setup. Would it be
  possible to read bitmaps from all physical drives at the same time?

  ~ Anders



