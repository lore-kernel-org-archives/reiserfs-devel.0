From: Hans Reiser <reiser@namesys.com>
Subject: Re: File system corruption!
Date: Wed, 25 Feb 2004 11:01:55 +0300
Message-ID: <403C5673.3080503@namesys.com>
References: <2A0946C0CB543B4EA5E41C21D97D256E1663AD@zorg.corp.zantaz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2A0946C0CB543B4EA5E41C21D97D256E1663AD@zorg.corp.zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fong Vang <fvang@corp.zantaz.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Fong Vang wrote:

>This is a new problem the file system isn't empty in this case but files are indeed missing (same setup.  RedHat Linux 7.1, Linux 2.4.20 kernel from RedHat, and ReiserFS 3.6.25.  SMP system with 4 GB of RAM, ~1 TB storage in RAID-10 configuration).  Although the file system isn't empty this time, we are loosing file (our application transaction log says file write completed fro last 7 files, but only four files show up in the ReiserFS file system).
>
>At the time of the problem, this was logged to the messages file:
>
>Feb 23 19:24:57 sc19-172-15 kernel: 3w-xxxx: scsi0: PCI Abort: clearing.
>Feb 23 19:26:02 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command (f73bd800) timed out, resetting card.
>Feb 23 19:26:04 sc19-172-15 kernel: 3w-xxxx: PCI Abort: clearing.
>Feb 23 19:27:03 sc19-172-15 kernel: 3w-xxxx: scsi0: Unit #0: Command (f73bd800) timed out, resetting card.
>  
>
These look like hardware errors, see www.namesys.com/support.html for 
help.  Soon we will take credit cards....

-- 
Hans


