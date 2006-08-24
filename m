From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: slow rebuild-tree
Date: Thu, 24 Aug 2006 23:23:25 +0200
Message-ID: <20060824212325.548B5CB1@philou.gramoulle.local>
References: <44EDF461.8020805@picture.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44EDF461.8020805@picture.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

On Thu, 24 Aug 2006 15:48:01 -0300
Cesar Augusto Bonadio <bonadio@picture.com.br> wrote:

  | Is this normal to take this long? any ideas?

Yes, i think so, especially if you have many files and that the partition
begins to be more full than empty ( say > 50%)

I used to operate some SCSI RAID5 disks attached to a megaraid controller and
the ~600Go partition could take 24hours to 48hours to fsck.

In the meantime you can strace the process and see that it's still running

# strace -p 19047

Good luck,

Truly yours,

Philippe
