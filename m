From: "Sascha Fleiss" <sfleiss@mfsconsulting.de>
Subject: Re: rebuild-trre Fails
Date: Sun, 15 Sep 2002 15:43:01 +0200
Message-ID: <006001c25cbd$cfbc3e70$fe01a8c0@sfhome>
References: <004601c25cb9$9ba85280$fe01a8c0@sfhome> <8584080687.20020915152348@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Hi,

> > Is there a way to tell reiserfsck to keep retrying without aborting ?
>
> I  do  not  recommend it. If you have a bad disk you should replace it
> and use dd_rescue to move all data off the broken disk to the new.

Normaly yes, but the f***ing Administrator before me has setup an 240 GB
Partition and I have no chance to get 240 GB free on other drive.
I don't think that's a problem from the disk, because it is an hardware RAID
Level 5 without errors on it. Probably I have errors on the SCSI-Bus, but I
changed the controller and cable with no effect. So I have no other ideas.
>
> - Anders
>

Sascha


