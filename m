From: =?UTF-8?B?SnVzc2kgU3V1dGFyaS1Kw6TDpHNrw7Y=?= <energy@ee.oulu.fi>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Sun, 17 Sep 2006 21:45:29 +0300
Message-ID: <450D97C9.7060808@ee.oulu.fi>
References: <ee1gcu$dgb$1@sea.gmane.org> <eebeu5$mi1$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-29914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <eebeu5$mi1$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Peter wrote:
> On Sun, 10 Sep 2006 17:01:18 +0000, Peter wrote:
>
> this bug was also reported on gentoo wrt the newer baselayout. Indications
> are it may be a r4 issue, although no one seems to know why!
>
> http://bugs.gentoo.org/show_bug.cgi?id=144093
>
>   
I have the same problem, segfault on boot if the system was shutdown 
properly.
For me the trouble appeared after upgrading to glibc-2.4, there's no 
problem at
all with glibc-2.3.6. On my system (amd64 platform with 64-bit gentoo 
installation)
it doesn't have anything to do with baselayout, just the glibc.
