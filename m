From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch 0/9] reiserfsprogs patch queue
Date: Mon, 24 Mar 2008 03:28:16 +0300
Message-ID: <47E6F5A0.7070308@gmail.com>
References: <20080124200226.606635000@suse.com> <4799C193.8010502@gmail.com> <479A03FF.6050702@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <479A03FF.6050702@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney wrote:

> Edward Shishkin wrote:
>
> >Thanks, queued.
> >Btw I got compilation errors. Have you missed something?
>
>
> Yeah, I guess I did. It builds fine on my SLES boxes, but not on my
> openSUSE machines. I'll them up for that (I need to anyway) and resend.
>

The following makes me think that something is
missed (the patch series was applied to 3.6.19):

main.c: In function `reiserfs_check_auto_state':
main.c:971: warning: unsigned int format, long int arg (arg 3)
mkreiserfs.c: In function `main':
mkreiserfs.c:730: warning: implicit declaration of function `block_size_ok'
tune.o(.text+0xa86): In function `main':
/home/edward/work/reiserfsprogs-3.6.19/tune/tune.c:268: undefined 
reference to `parse_time'
collect2: ld returned 1 exit status
make[1]: *** [reiserfstune] Error 1
