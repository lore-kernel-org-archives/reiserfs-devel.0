From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 changes meaning of ENOENT/EACCES, breaking gcc?
Date: Fri, 30 Jul 2004 22:22:48 -0700
Message-ID: <410B2CA8.6070905@namesys.com>
References: <41098E4C.9070007@kundert.ca>            <410A9A1F.1090406@namesys.com> <200407302057.i6UKvLAu000714@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19884-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407302057.i6UKvLAu000714@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Perry Kundert <perry@kundert.ca>, reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Fri, 30 Jul 2004 11:57:35 PDT, Hans Reiser said:
>
>  
>
>>>   By the way, his suggested workaround was effective...
>>>      
>>>
>>Can you talk the glibc guys into adopting it?  That would be best.
>>    
>>
>
>Somebody should also check the POSIX spec and see if it requires a
>particular semantic there.
>
>Also, pushing it off to the glibc people is quite possibly the wrong
>way to go about it.  Do you *really* want to sit there and tell every
>other app that turns up with a similar problem that they have to fix
>it to run on one particular filesystem, when every OTHER filesystem
>doesn't need help?  That doesn't sound like a good plan - if 4 or 5
>apps turn up, it will turn people away "because stuff breaks if you
>use reiser4"....
>
>  
>
That is the cost of progress.  Just look at all the confusion caused by 
phasing out horse whips and using gas pedals instead.....

We are adding functionality.  The standards will adjust to that in 5 
years.  I am 40, 5 years seems like not so long....
