From: Oleg Drokin <green@namesys.com>
Subject: Re: error compiling reiserfsprogs
Date: Fri, 2 May 2003 12:06:12 +0400
Message-ID: <20030502080612.GD20656@namesys.com>
References: <00e001c30f5a$91f71bf0$0f02a8c0@observer> <200304302124.h3ULOi5J009954@turing-police.cc.vt.edu> <20030501062527.GA22815@namesys.com> <200305011800.h41I0wxj005681@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305011800.h41I0wxj005681@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Network Operations <downtown@cwo.com>, reiserfs-list@namesys.com

Hello!

On Thu, May 01, 2003 at 02:00:58PM -0400, Valdis.Kletnieks@vt.edu wrote:
> > Well, in fact kernel headers are supplied with glibc, otherwise I agree that 
> error looks like
> > missing kernel headers installed.
> At least under RedHat, the kernel headers that come with gcc are shipped
> in a seperate RPM glibc-kernheaders, the numbering of which doesn't follow
> anything else:

sure. The only thing that you seem to get incorrectly is that
headers are shipped with *glibc*, not gcc.
They even have "glibc" as part of the name.
After all you compile glibc against some known kernel.
not gcc.

> 
> % rpm -q glibc glibc-kernheaders kernel
> glibc-2.3.2-27.9
> glibc-kernheaders-2.4-8.10
> kernel-2.4.20-9
> 

Bye,
    Oleg
