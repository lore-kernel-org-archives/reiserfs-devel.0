From: Christian Kujau <evil@g-house.de>
Subject: Re: Fatal File System Corruption -Software RAID + NFS
Date: Sun, 16 Nov 2003 20:28:43 +0100
Message-ID: <3FB7CFEB.9080705@g-house.de>
References: <3FB7AE00.4070409@uiuc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB7AE00.4070409@uiuc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Poulakos <poulakos@uiuc.edu>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Steven Poulakos wrote:
[...]
> Here are snippets of the errors that just repeat over and over...
> 
> Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
> DriveReady SeekComplete DataRequest }
> Nov  9 06:47:34 ctdev kernel:
> Nov  9 06:47:34 ctdev kernel: hdc: status error: status=0x58 { 
> DriveReady SeekCo

hardware errors, i'd say :-(
try to dd / dd_rescue to a working disk, then go on with newest 
reiserfsprogs or /bin/cat...

Christian.
-
BOFH excuse #6:

global warming

