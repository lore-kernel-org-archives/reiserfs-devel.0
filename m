From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: Error messages. - Possible sollution.
Date: 10 Mar 2003 08:53:50 +0100
Message-ID: <1047282830.11706.20.camel@fortknox>
References: <7473069171.20030305201818@tnonline.net>
	 <13190438906.20030310011427@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <13190438906.20030310011427@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 2003-03-10 at 01:14, Anders Widman wrote:
>    It  seems  as  there  is  a compatibility problem regarding certain
>    series  of  the  Maxtor  harddrives  and  Promise  U100  Tx2 boards
>    (perhaps all U1xx ?).
> 
>    The  problem  is  that Maxtors older/original series of 80, 120 and
>    160GB  models  give  system  lockups, poor transfer speeds and fail
>    SMART self test.
> 
>    Newer  drives from Maxtor (those originating in Quantum technology)
>    do work. At least the 60GB 540DX model.
> 
>    Seagate  and IBM drives seem to have no problem with Promise cards.
> 
>    So,  all  in  all  I  believe to have found one source of problems,
>    though  there  might  still be more. I will continue to investigate
>    and post any more findings.

could be true... I only had 3 maxtor drives on the PDC20268... so it
could be the drives again (I just had this problem with WDC's)... is one
of these among the suspicius ones ?

Maxtor 4R080J0
Maxtor 4D080H4
Maxtor 4D080K4

However these did never fail a SMART self test, and the transfer speed
also was not poor.

Soeren.

