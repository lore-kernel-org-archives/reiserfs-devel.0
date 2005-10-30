From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 SCSI Bug?
Date: Sat, 29 Oct 2005 20:22:38 -0700
Message-ID: <43643C7E.4080703@namesys.com>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU> <37550.130.215.239.65.1130545649.squirrel@webmail.WPI.EDU> <43639DFA.1020107@namesys.com> <43640228.7080807@wpi.edu> <4364033C.5010200@namesys.com> <436406DF.8070104@wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <436406DF.8070104@wpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Isaac Chanin <chanin@WPI.EDU>
Cc: Steve Olivieri <steve86@WPI.EDU>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Isaac Chanin wrote:

> Hans Reiser wrote:
>
>>
>> It should be not 256, but BIO_MAX_PAGES, yes?   Defining limits in two
>> places is bad, yes?
>>
>>
>
> Yeah, I think the code is running into two different limits here.
> Reiser4 wants it to be nr, but limits it to BIO_MAX_PAGES.  However,
> apparently, the BIO_MAX_PAGES limit does not take into consideration
> the underlying 256 limit imposed by bio_alloc.
>
> I'm not quite sure if having the two different limits is a bad thing
> in this case, unless BIO_MAX_PAGES can be made to (or is supposed to,
> and there's a bug) take into account the 256 limit.
>
> I suppose the other solution is to not use bio_alloc et al due to the
> 256 limit, and find another method that allows values as large as
> BIO_MAX_PAGES, under the current implementation, will grow to.
>
>
but you said:

"In any case, BIO_MAX_PAGES is defined to be 256"

Now I am confused.

We should use the same macro defining our limit as the underlying layer uses.  What macro is that called?


