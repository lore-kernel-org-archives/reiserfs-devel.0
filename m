From: Scott A Crosby <scrosby@cs.rice.edu>
Subject: Re: Terrible performance (<100kb/sec) in a cp -Raf
Date: 17 Jun 2004 09:49:53 -0500
Sender: scrosby@cs.rice.edu
Message-ID: <oyd3c4utf1q.fsf@bert.cs.rice.edu>
References: <oyd4qpee0fv.fsf@bert.cs.rice.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <oyd4qpee0fv.fsf@bert.cs.rice.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 14 Jun 2004 08:25:24 -0500, Scott A Crosby <scrosby@cs.rice.edu> writes:

> Hello, as part of a planned migration of my computer from ext3 to
> reiserfs I experienced terrible performance. I was running a stock
> linux 2.6.6 kernel on AMD XP-2500+ CPU with 1.5gb of RAM.

Responding to Pierre's comments:

I appreciate the help, but I am using an external USB drive, not an
external firewire drive. The kernel patch only modifies the
ieee1394_core.c file, which is unused in my system.

Also, my error seems related to Fabian Sturm's report a couple of days
ago about 'no space left on device'. When I waited for the bulk copy
to stop, 'cp' reported no space available even though the partitian is
only 17% used. 

Scott
