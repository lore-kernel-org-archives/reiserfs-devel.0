From: Anders Widman <andewid@tnonline.net>
Subject: Re: rebuild-trre Fails
Date: Sun, 15 Sep 2002 15:23:48 +0200
Message-ID: <8584080687.20020915152348@tnonline.net>
References: <004601c25cb9$9ba85280$fe01a8c0@sfhome>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <004601c25cb9$9ba85280$fe01a8c0@sfhome>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hi List,

> I have a corrupted Reiserfs and trying to fix something using rebuild-tree.

> But this fails every time because some blocks can't be read. I think is
> because SCSI-Problems, because it stop's every time on another block.

> Is there a way to tell reiserfsck to keep retrying without aborting ?

I  do  not  recommend it. If you have a bad disk you should replace it
and use dd_rescue to move all data off the broken disk to the new.

- Anders

> Regards,

> Sascha Fleiss

