From: =?us-ascii?Q?Mr=2E=20Tao?= <tao@post.cz>
Subject: =?us-ascii?Q?Re=3A=20kernel=20BUG=20at=20fs=2Freiser4=2Fplugin=2Fitem=2Fctail=2Ec?=
Date: Tue, 05 Aug 2008 14:42:31 +0200 (CEST)
Message-ID: <419.1460-12001-642789338-1217940151@post.cz>
References: <a08621850808041457y2f30559ve104c2a86a5f9970@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a08621850808041457y2f30559ve104c2a86a5f9970@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?us-ascii?Q?Dushan=20Tcholich?= <dusanc@gmail.com>
Cc: =?us-ascii?Q?Edward=20Shishkin?= <edward.shishkin@gmail.com>, =?us-ascii?Q?Reiserfs=20mailing=20list?= <reiserfs-devel@vger.kernel.org>

> >>> Dushan Tcholich wrote:
> >>
> >>
> >>> Mr. Tao, do you still have partitions that make fsck segfault?
> >>>
No, sorry, (un)fortunatelly not any more. These errors occured when fscking portage and ccache partitions, which I decided to put in separate disk partitions, so I used mkfs.reiser4 to "correct" them. (In the past I had them as uncompressible loop files on root reiser4 CC partition, but this _always_ (and I've tried a lot of times with different kernels) led to fatal corruption of root fs --> *loop files on R4 is no go* solution).  I also had them as part of root FS, but this approach was also futile and led to corruption of / FS. Seems like (at least at thouse times) R4 couldn't handle very well heavy load, as there are moments with gentoo, where both ccache and portage are under stress.
