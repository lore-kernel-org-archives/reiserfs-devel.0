From: berthiaume_wayne@emc.com
Subject: RE: different block sizes and badblocks
Date: Fri, 21 Jun 2002 10:35:25 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFBD5@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com, newsmail@satimex.tvnet.hu

	How does reiserfs normally handle a bad block encountered on a read
at this time?

-----Original Message-----
From: Oleg Drokin [mailto:green@namesys.com]
Sent: Thursday, June 20, 2002 12:22 PM
To: Newsmail
Cc: reiserfs-list@namesys.com
Subject: Re: [reiserfs-list] different block sizes and badblocks


Hello!

On Thu, Jun 20, 2002 at 02:05:11PM +0100, Newsmail wrote:
> I have two questions: I see that in reiserfsprogs 3.x.1c-pre5 we have the 
> option to make filesystem with different block sizes than the default 4096

> bytes. what does this mean? I can choose whatever blocksize I want? or it 
> has to be a multiple of 4096? actually as I heard if I have a filesystem 

Right now kernel lacks support for blocksize other than 4096 bytes.

> the other question is about badblocks. we have badblock support in 
> reiserfsprogs 3.x.1c-pre5, but its disabled by default. Oleg, could you 
> give me some infos about it, how can I reenable it, or how does it work 
> actually? it would be really nice :)

Right now badblocks support is disabled on purpose.
It conflicts with savelinks and we have not decided how to solve that yet.
But we will announce badblocks support once we think it is ready.

Bye,
    Oleg
