From: Anders Widman <andewid@tnonline.net>
Subject: ReiserFS and NFS?
Date: Tue, 3 Sep 2002 17:56:52 +0200
Message-ID: <18030661062.20020903175652@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   Hello!

   I am trying to use ReiserFS with NFS to work nicely, but I ran into
   troubles  exporting root (/). I am getting the following error when
   a   client   tries  to  connect  to  the  root  export  (I am using
   ReiserFS on root filesystem):

      rpc.mountd: getfh failed: Operation not permitted

   After  browsing around different mailing lists and read suggestions
   about Kernel and NFS utils I found that someone said that there was
   needed patches to use ReiserFS with NFS?

   Right now my exports file looks like this:

         /usr/src/       192.168.0.100(rw,no_root_squash,insecure)
         /               192.168.0.100(rw,no_root_squash,insecure)

   The /usr/src/ share does work.

   Is this something someone might know how to fix?

   Regards,
   Anders Widman

