From: jenn sirp <sirp1@llnl.gov>
Subject: keys and inodes
Date: 02 Jul 2004 14:01:42 -0700
Message-ID: <1088802102.6434.80.camel@murdock.llnl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I was hoping someone might be able to answer a couple of questions about
inodes is Reiser(v3).

I would like to know how ReiserFS inodes and the VFS inodes in the
d_cache correspond with each other. Specifically, how and where it is
that 'keys' get mapped to inodes in the system? 

Do ReiserFS keys change or get reconstructed when tails are packed or
when the tree gets re-balanced? Or do keys remain consistent throughout
a file's lifetime in the system?

Even the quickest response would be greatly appreciated.

Thanks,

Jenn



