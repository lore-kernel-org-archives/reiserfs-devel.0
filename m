From: Payal Rathod <payal-fs@scriptkitchen.com>
Subject: somewhat OT query on journalling
Date: Wed, 19 Jul 2006 11:27:44 -0400
Message-ID: <20060719152744.GA26155@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,
I was just reading about filesystems and my ideas are a bit confused.
I read quite a few articles on net but still my basic doubts are not 
completely clarified. I thought this would be the right place to ask, since many 
journalling gurus might be here.
Can someone tell me do journalling fs maintain journal about the 
metadata or the all the data?
Also, is it true that now-a-days there is no such thing as inode "block"
since  for faster access the inodes are kept near the data itself?
How is the journal maintained? How is it prevented from being
too big and why are these fs not slower than traditional fs since it 
involves an overhead of writing to a journal?
And lastly don't the journalling fs give a false sense of security to 
the user, saying that the data is written to disk when in reality only an 
entry is made in journal and data is still not committed to disk.

Thanks a lot for the patience and eagerly waiting for any replies.

With warm regards,
-Payal

