From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: -mm issues with Reiserfs and deleting files.
Date: Mon, 24 Nov 2003 15:01:53 +0300
Message-ID: <16321.62257.896533.575451@laputa.namesys.com>
References: <20031121145843.60cb83c0.angel666@socal.rr.com>
	<20031121151005.35c17e58.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031121151005.35c17e58.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Angel <angel666@socal.rr.com>
Cc: Andrew Morton <akpm@osdl.org>, Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Andrew Morton writes:
 > Angel <angel666@socal.rr.com> wrote:
 > >
 > > angel velocity-0.1 # rm config.log
 > > rm: cannot remove `config.log': Permission denied
 > > angel velocity-0.1 # whoami
 > > root
 > > angel velocity-0.1 #

[Andrew, please forward reiserfs bug reports to the
Reiserfs-Dev@Namesys.COM and Reiserfs-List@Namesys.COM, this has better
chances to get fast response.]

 > > 
 > > All files from a certain directory are unable to be deleted.  I have since tested it in other kernels such as 2.4 and back tracked through the -mm series (of versions I had installed) to where I could still remove files.  It works in 2.6.0-test7-mm1 but fails in 2.6.0-test9-mm3, 2.6.0-test9-mm4, and 2.6.0-test9-mm5.  touch also fails in this directory.  The directorys where this weird behavior is happening isn't unique and seems randomly spread throughout the filesystem.  I have run the filesystem through reiserfsck and it turned out clean.  I hope I have sent the bug report to the proper person and I thank you for all your hard work.
 > > 

We had similar report recently, also about -mm kernels. In that case
user fixed it by doing 

$ chown -R someuser.somegroup /directory-with-unkillable-file

I wasn't able to trace causes of this problem. May be we shall be
luckier this time:

1. are there any messages in the kernel log?
2. with what options reiserfs is mounted (cat /proc/mounts)?
3. send us output of "strace rm config.log"

 > 
 > Nikita works on reiserfs...
 > 
 > He'll probably ask you to test 2.6.0-test9.

Nikita.
