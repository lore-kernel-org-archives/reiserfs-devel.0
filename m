From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: data-logging-20  BUG?!
Date: Wed, 31 Jul 2002 00:41:42 +0200
Message-ID: <3D471626.9060500@mb.tu-ilmenau.de>
References: <3D427179.2070401@mb.tu-ilmenau.de> <1027970955.12087.6.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/29/2002 09:29 PM, Chris Mason wrote:
> On Sat, 2002-07-27 at 06:10, Manuel Krause wrote:
> 
> 
>>After having upgraded from data-logging -19 to -20 and using it for some 
>>hours I keep getting this bug (kernel BUG at journal.c:724!):
> 
> 
> Ok, I've uploaded -21, and it should fix the BUG().  It was a debugging
> check to make sure the journal code had properly sent all the ordered
> buffers to disk before sending the commit down.  There was a race in -20
> that broke this rule.
> 
> The oops should not have caused any corruptions, the incremental from
> -20 to -21 is below.
> 
> -chris
> 

Hi!

The new -21 patch works fine on here. After going back to -19 I found 
out -20 really didn't cause any corruptions.  :-))


Thank you, Chris!

Manuel

