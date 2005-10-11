From: Peter Nixon <listuser@peternixon.net>
Subject: Re: corrupted disk
Date: Tue, 11 Oct 2005 17:07:32 +0300
Message-ID: <200510111707.32746.listuser@peternixon.net>
References: <200510111602.24857.listuser@peternixon.net> <200510111634.40710.listuser@peternixon.net> <20051011135522.GB2763@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051011135522.GB2763@favonius>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: reiserfs-list@namesys.com

On Tuesday 11 October 2005 16:55, Sander wrote:
> Peter Nixon wrote (ao):
> > On Tuesday 11 October 2005 16:31, Sander wrote:
> > > Peter Nixon wrote (ao):
> > > > At 06:15 this morning the following errors showed up in
> > > > /var/log/messages
> > > >
> > > > Oct 11 06:15:03 DB2MUHASEBE kernel: kernel BUG at prints.c:334!
> > > > Oct 11 06:15:03 DB2MUHASEBE kernel: invalid operand: 0000
> > > > 2.4.21-138-smp #1 SMP Fri Oct 31 00:51:31 UTC 2003
> > > >
> > > > Oct 11 06:15:03 DB2MUHASEBE kernel: EIP:    0010:[<c5096ec8>]   
> > > > Tainted: P
> > >
> > > Your kernel is very, very old and tainted.
> >
> > Yes. I am aware of that. As I mentioned the server is an IBM server
> > running SUSE Linux Enterprise 8 and DB2. At the time of deployment of the
> > server SLES 9 was not yet certified to run with DB2.
>
> What I'm trying to say is that you are very unlikely to receive support
> on such an old kernel. And most likely the bug is fixed in a younger
> kernel.
>
> And, you are also running a tainted kernel. You are less likely to
> receive support on a tainted kernel.

Yes I understand the issue, however without running an official SLES kernel 
the customer cannot receive support on DB2 or on their IBM hardware. If there 
is a bug in the kernel that causes this then I need to get SUSE to roll a new 
kernel and get it certified by IBM. If it is a bug in the SCSI driver (the 
module that taints the kernel) then I need to report it to IBM and get them 
to supply a fixed module.

-- 

Peter Nixon
http://www.peternixon.net/
PGP Key: http://www.peternixon.net/public.asc
