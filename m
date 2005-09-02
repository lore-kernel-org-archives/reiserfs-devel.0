From: Lexington Luthor <lexington.luthor@gmail.com>
Subject: Re: Incite into reiser5?
Date: Fri, 02 Sep 2005 23:08:43 +0100
Message-ID: <dfaihh$m2d$1@sea.gmane.org>
References: <1125596442.5207.11.camel@jove> <b14e81f0050901193220855450@mail.gmail.com> <1125685758.9150.8.camel@jove> <43189B26.2030602@slaphack.com> <873bonuurh.fsf@evinrude.uhoreg.ca> <4318AB3B.1090204@slaphack.com> <dfacls$4pd$2@sea.gmane.org> <4318C9E8.80804@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4318C9E8.80804@slaphack.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

David Masover wrote:
> Don't know about ocfs, I'll look it up later.
> 
> But, AFAIK, GFS is for things like ATA-over-ethernet, where you have
> multiple machines attached to the same hard drive -- not for situations
> where multiple machines each have their own drive, and you want them to
> appear as one logical drive.
> 

GFS uses shared storage, but that does not mean it needs to be central.

I imagine one can use GFS in a cluster of machines where each machine 
shares its drive as a block device, which can be combined using LVM to 
create one giant logical network drive which can be mounted using GFS on 
each machine.

One could easily set this up with the code currently in the kernel, GFS 
supports redundancy and multiple journals so reliability is not a problem.

LL

