From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs (3.6.9, .10, .11) installation problems
Date: Fri, 22 Aug 2003 12:18:21 +0400
Message-ID: <200308221218.21594.vitaly@namesys.com>
References: <m3n0e3ript.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3n0e3ript.fsf@multivac.cwru.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jarc <prj@po.cwru.edu>
Cc: reiserfs-list@namesys.com

On Thursday 21 August 2003 03:51, Paul Jarc wrote:
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

Hi Paul,

thanks for the report, all is fixed and will be included 
into the next release.

Vitaly Fertman
