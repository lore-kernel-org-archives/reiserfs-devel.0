From: Narasimha_Subban <Narasimha_Subban@Satyam.com>
Subject: RE: Regarding the resize_reiserfs
Date: Sat, 26 Oct 2002 14:03:41 +0530
Message-ID: <A56BCCA3A5C2D411B18A00508BDE9C9B04D6F518@bla.satyam.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Asheesh Laroia <asheesh@asheesh.org>, Narasimha_Subban <Narasimha_Subban@Satyam.com>
Cc: reiserfs-list@namesys.com

HI,
  Thanks for ur suggestions. In our requirement i shouldn't reboot the
system at any cost. I would appreciate any better way to do without
rebooting the system. 

Thanks and Rgds
Narasimha Subban K.V

> -----Original Message-----
> From:	Asheesh Laroia [SMTP:asheesh@asheesh.org]
> Sent:	Saturday, October 26, 2002 12:18 PM
> To:	Narasimha_Subban
> Cc:	reiserfs-list@namesys.com
> Subject:	Re: [reiserfs-list] Regarding the resize_reiserfs
> 
> Under Linux, you may need to restart your computer to have the new
> partition size show up for /dev/hd*.  (At least, I know we had to do that
> back in the 2.2.x days.)
> 
> So, try restarting (and I mean re-initializing the kernel, not just going
> to single-user mode) and trying this; that may fix it.
> 
> -- Asheesh.
> 
> On Sat, 26 Oct 2002, Narasimha_Subban wrote:
> 
> > Hi,
> >    I am using the reiserfs-3.6.3 version on Linux-2.4.7-10 kernel
> version. I
> > need some information on resize_reiserfs command.
> > I have a partition (assume /dev/hda8 with 1000 blocks) having reiserfs
> > filesystem.
> > I increased the partition size (Now /dev/hda8 with 2000 blocks) in the
> > partition table using the fdisk command. Now i tried to resize the
> > filesystem using (resize_reiserfs -s+xxM  /dev/hda8) so that increased
> > partition size in partition table is reflected in filesystem. The error
> is
> > as below
> > /dev/hda8 is of XXXXXX blocks size only with reiserfs of XXXXXX blocks
> size
> > on it. You are trying to expant reiserfs up to YYYYYY size. You probably
> > forgot to expand your partition size.
> > But i shouldnot delete the partition bcoz the contents shouldn't be
> lost.
> >    It will be great if anyone gives some ideas to make resize_reiserfs
> work.
> >
> >
> > Thanks and Rgds
> > Narasimha Subban K.V
************************************************************************** 
This email (including any attachments) is intended for the sole use of the
intended recipient/s and may contain material that is CONFIDENTIAL AND
PRIVATE COMPANY INFORMATION. Any review or reliance by others or copying or
distribution or forwarding of any or all of the contents in this message is
STRICTLY PROHIBITED. If you are not the intended recipient, please contact
the sender by email and delete all copies; your cooperation in this regard
is appreciated.
**************************************************************************
