From: "Christian Stuke" <chstuke@exinferis.de>
Subject: Re: fsync() Performance Issue
Date: Thu, 2 May 2002 07:07:18 +0200
Message-ID: <006d01c1f197$3dd0bbd0$fe78a8c0@exinferis>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com> <20020430182005.A1788@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

Could we have this for 2.4.18+ pending also please?

Chris
----- Original Message -----
From: "Oleg Drokin" <green@namesys.com>
To: <berthiaume_wayne@emc.com>
Cc: <reiserfs-list@namesys.com>
Sent: Tuesday, April 30, 2002 4:20 PM
Subject: Re: [reiserfs-list] fsync() Performance Issue


> Hello!
>
> On Fri, Apr 26, 2002 at 04:28:26PM -0400, berthiaume_wayne@emc.com wrote:
> > I'm wondering if anyone out there may have some suggestions on how
> > to improve the performance of a system employing fsync(). I have to be
able
> > to guaranty that every write to my fileserver is on disk when the client
has
> > passed it to the server. Therefore, I have disabled write cache on the
disk
> > and issue an fsync() per file. I'm running 2.4.19-pre7, reiserfs 3.6.25,
> > without additional patches. I have seen some discussions out here about
> > various other "speed-up" patches and am wondering if I need to add these
to
> > 2.4.19-pre7? And what they are and where can I obtain said patches?
Also,
> > I'm wondering if there is another solution to syncing the data that is
> > faster than fsync(). Testing, thusfar, has shown a large disparity
between
> > running with and without sync.Another idea is to explore another
filesystem,
> > but I'm not exactly excited by the other journaling filesystems out
there at
> > this time. All ideas will be greatly appreciated.
>
> Attached is a speedup patch for 2.4.19-pre7 that should help your fsync
> operations a little. (From Chris Mason).
> Filesystem cannot do very much at this point unfortunatelly, it is ending
up
> waiting for disk to finish write operations.
>
> Also we are working on other speedup patches that would cover different
areas
> of write perfomance itself.
>
> Bye,
>     Oleg
>

