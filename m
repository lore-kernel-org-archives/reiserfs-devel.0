From: Yury Umanets <umka@namesys.com>
Subject: Re: reiserfsprogs (3.6.9, .10, .11) installation problems
Date: Thu, 21 Aug 2003 13:44:28 +0400
Message-ID: <1061459068.30048.19.camel@haron.namesys.com>
References: <m3n0e3ript.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3n0e3ript.fsf@multivac.cwru.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jarc <prj@po.cwru.edu>
Cc: reiserfs-list@namesys.com

On Thu, 2003-08-21 at 03:51, Paul Jarc wrote:
> If pdksh is being used to run reiserfsprogs' ./configure, the script
> triggers a bug in pdksh.  This line triggers the bug:
> 		fprintf(fout, "\t\\\" "\n");
> AFAICT, this is supposed to become a C string containing tab,
> backslash, an newline.  Right?  Then this will work for both bash and
> pdksh:
> 		fprintf(fout, "\\t\\\\\\n");
> 
> Also, this earlier line is misspelled:
> #define _GNU_SOURSE
> It should be:
> #define _GNU_SOURCE
>                  ^
> But since it works even when it's misspelled, it probably doesn't need
> to be there at all.
> 
> 
> paul

Thanks for report. Vitaly will fix this in few days.


