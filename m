From: berthiaume_wayne@emc.com
Subject: RE: Reiserfs oops
Date: Thu, 24 Apr 2003 08:29:29 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D007AA844B@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com

	Cool... Thanks Oleg for taking a look at it.
Wayne.


> -----Original Message-----
> From: Oleg Drokin [mailto:green@namesys.com]
> Sent: Thursday, April 24, 2003 1:22 AM
> To: berthiaume_wayne@emc.com
> Cc: reiserfs-list@namesys.com
> Subject: Re: Reiserfs oops
> 
> 
> Hello!
> 
> On Wed, Apr 23, 2003 at 05:08:58PM -0400, 
> berthiaume_wayne@emc.com wrote:
> 
> > > Hm, You mean that all four drives have a bad block in the 
> same place?
> > 	Only one drive has the bad block. md() doesn't break 
> the mirror and
> > drop the drive.
> 
> Hm. Looks like this is md bug or something like that.
> Buffer with journal header have disappeared under our foot, 
> or at least I
> think so.
> I am not sure what we can do about it.
> 
> Bye,
>     Oleg
> 
