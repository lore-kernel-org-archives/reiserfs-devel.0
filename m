From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sun, 16 Mar 2003 01:34:45 +0100
Message-ID: <3E73C6A5.3070201@mb.tu-ilmenau.de>
References: <200303141942.00679.phma@webjockey.net> <3E728FFB.90905@mb.tu-ilmenau.de> <200303151917.12807.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/16/2003 01:17 AM, Pierre Abbat wrote:
> On Friday 14 March 2003 21:29, Manuel Krause wrote:
> 
>>Try the latest -pre-release
>>ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.5-pre2.tar.gz
>>
>>that is said to have some bug fixes against the latest reiserfsprogs
>>release
>>ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz
>>
>>and a plus of performance and this release link is only given in case
>>you believe in release numbering itself.
> 
> I just compiled the prerelease and will try it first on /var, which is equally 
> corrupted (the computer was getting a lot of mail and I use Maildir). The 
> glibc versions differ, so I'd like to build it statically. How do I do this?

I wanted to have written this in my mails yesterday night.

You'll need to process

  make LDFLAGS='-static'

or have this LDFLAGS set somewhere in the Makefile what I can't tell 
anything more about. Maybe Oleg & Company can if that command doesn't work.

Best wishes,

Manuel

