From: "Bill Rees" <brees@benchmarkautomation.com>
Subject: RE: How to build a big file server
Date: Thu, 5 Jun 2003 07:27:04 -0400
Message-ID: <NHBBIGLOALLFLCNJNOLHMEFDCBAA.brees@benchmarkautomation.com>
References: <200306051045.53677.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306051045.53677.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

I'll second the 3ware recommendation.

-----Original Message-----
From: Marc-Christian Petersen [mailto:m.c.p@gmx.net]
Sent: Thursday, June 05, 2003 4:46 AM
To: Heinz-Josef Claes; Ragnar Kj=F8rstad
Cc: reiserfs-list@namesys.com
Subject: Re: How to build a big file server


On Thursday 05 June 2003 10:42, Heinz-Josef Claes wrote:

Hi Heinz,

> We used a cheap 3Com IDE RAID controler (sorry, don't know which one)
> one and a half year ago (without writeback-cache, in another company).
> It was terribly slow when writing with hardware RAID. With software
> RAID, it was much faster - that's the reason for my question. Do you
> know a useful IDE RAID controler which runs with linux? (For your
> information: the machines are not mission critical, only for having an
> (additional) online backup for about 5000 users).
3ware Controller. Works perfect.

--
ciao, Marc


