From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] finally... data logging for 2.4.20-pre10
Date: Fri, 18 Oct 2002 15:41:00 +0200
Message-ID: <3DB00F6C.6060609@mb.tu-ilmenau.de>
References: <1034709883.5053.920.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 10/15/2002 09:24 PM, Chris Mason wrote:
> Hello all,
> 
> I've uploaded new data logging code against 2.4.20-pre10 to 
> 
> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20
> 
> The mirror might take a little while to update.
> 
> This code is lightly tested, use with caution for a few days.  The
> journal relocation patches are not complete yet, I haven't integrated
> them with the new options parsing code in 2.4.20-pre, so you can't pass
> -o jdev= when mounting the FS.
> 
> Aside from merging into the latest kernel, there are a few bug fixes for
> corner case oopsen hit during suse testing.
> 
> -chris
> 

Hi !

Yesterday I added the 2.4.20-pre10 data-logging test results to

  http://manuel.krause.bei.t-online.de/topics/sw-tests.2.htm

The data-logging tests were performed in data=ordered mode. For all 
these tests disk content remained the same.

Somehow 2.4.19-final was faster than everything that followed...

Best regards,

Manuel

