From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Interesting reading that I agree with;-)
Date: Thu, 23 May 2002 03:24:33 +0200
Message-ID: <20020523012433.GA20563@schmorp.de>
References: <3CEBAC2D.2030002@namesys.com> <20020522194204.GD458@turbolinux.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020522194204.GD458@turbolinux.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, May 22, 2002 at 01:42:04PM -0600, Andreas Dilger <adilger@clusterfs.com> wrote:
> an absolute path to a file.  The only thing that appears to be needed
> for this is the new syscall and the applications to actually use it.

The syscall is named "readlink":

   ls -ld /proc/self/fd/0
   lrwx------    1 root     root           64 May 23 03:23 0 -> /dev/pts/1

Of course, it has to solve problems like the stupid way of appending
(instead of prepending) "(deleted)".

Much more useful. IMHO, would be a flink() call, although it might destroy
some optimizations in some filesystems ;->

-- 
      -----==-                                             |
      ----==-- _                                           |
      ---==---(_)__  __ ____  __       Marc Lehmann      +--
      --==---/ / _ \/ // /\ \/ /       pcg@goof.com      |e|
      -=====/_/_//_/\_,_/ /_/\_\       XX11-RIPE         --+
    The choice of a GNU generation                       |
                                                         |
