From: Anders Widman <andewid@tnonline.net>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 09:43:32 +0100
Message-ID: <76121382843.20030306094332@tnonline.net>
References: <7473069171.20030305201818@tnonline.net>
 <20030306095743.B5417@namesys.com> <170120728875.20030306093238@tnonline.net>
 <20030306114045.B12355@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030306114045.B12355@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello!

> On Thu, Mar 06, 2003 at 09:32:38AM +0100, Anders Widman wrote:

>> > And for this case I am sure this was a scratchy CD-ROM disk in my CD-ROM drive.
>>    Well, have no CD-ROM. :)

> /dev/hdg is one of my CD-ROMs ;)

>> > Probably same stuff can be get when drive is busy remapping bad sectors?
>> > Use smartctl to find out how these messages corellate with remapped bad sectors counts?
>>   Very strange. Would mean all of my harddrives would be broken, or on
>>   their  way  to  get  broken.  I  do  not  believe that.  Most of the
>>   hardware, including the cabling has been replaced and changed.

> Well, seems as Wayne have noticed, you have one common part:
> Promise controllers. How about using different kind of controller
> on one of the boxes and see if it helps?

Perhaps,  but  the  same  happens on the internal controller. In fact,
the  internal  controller  (either VIA or the Intel) causes the system
to freeze when it happens to many times.

> Bye,
>     Oleg


   



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

