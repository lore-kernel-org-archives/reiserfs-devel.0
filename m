From: Anders Widman <andewid@tnonline.net>
Subject: Re: some troubles with mounting reiserfs
Date: Thu, 1 May 2003 19:59:36 +0200
Message-ID: <328486498.20030501195936@tnonline.net>
References: <000101c3100a$d9356b60$0832a8c0@dell8100>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000101c3100a$d9356b60$0832a8c0@dell8100>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serge Rodrigues <serge@onpoi.net>
Cc: reiserfs-list@namesys.com

> After a very very very long badblocks -n -s -b 4096 /dev/hdb1, it found
> some badblocks. What I need to do for recover my HDD if any solution
> exist ?

  The  best  thing is to use dd_rescue to copy the disk to a new drive
  of at least the same size, or to an imagefile that fits onto another
  drive.  Then you can run fsck on that imagefile or the new drive and
  send  your  old  one back for warranty service. DO NOT try to fsck a
  faulty drive. It will only cause more damage.

  //Anders


--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

