From: Rudy Zijlstra <rudy@edsons.demon.nl>
Subject: Re: samba
Date: Sat, 05 Oct 2002 10:41:17 +0200
Message-ID: <3D9EA5AD.9030302@edsons.demon.nl>
References: <3D9E8451.5010605@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gertjan Vinkesteijn <gvink@xs4all.nl>
Cc: the filesystem <reiserfs-list@namesys.com>


Gert-Jan,

You surprise me. You are telling me i am doing something impossible?

/dev/md0 on /home type reiserfs (rw)
/dev/md1 on /export_smb type reiserfs (rw)

Both are and have been exported using samba for years, and have been 
Reiserfs since early 2000.

Cheers,

Rudy

Gertjan Vinkesteijn wrote:

> Dear audience,
>
> Last year samba was not yet possible on reiserfs, it is on xfs from 
> sgi though. Does anybody know if work has been done in that area? It 
> would be very handy having (parts of) my 40GByte reiserfs filesystem 
> letting share on our subnet with windows computers.
>
> Appreciate your thoughts
>



