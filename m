From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Journaling mode
Date: Wed, 11 Aug 2004 19:39:02 +0200
Message-ID: <200408111939.02611.christian.mayrhuber@gmx.net>
References: <d68fdf7d04081110265ea9db94@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d68fdf7d04081110265ea9db94@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 11 August 2004 19:26, Vijayan Prabhakaran wrote:
> Hi,
>
> I'm new to Reiserfs. I think this question might have been answered
> before but I couldn't find it.
>
> I'd like to run Reiserfs with different journaling modes
> (data/ordered/writeback). Are these different journaling modes
> supported only in Linux 2.6 or are they available in Linux 2.4 ?
No, they aren't.
You need the following patches for kernel 2.4.25 - 2.4.27: 
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/

data=ordered is only in kernel 2.6.6 upwards and 
data=journal is only in kernel 2.6.7 upwards, if I remember right.

-- 
lg, Chris

