From: wolff@hydra.bitwizard.nl
Subject: Reiserfs version???
Date: Thu, 7 Aug 2003 12:26:42 +0200
Message-ID: <20030807102642.GA14567@hydra.bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15219-reiserfs=m.gmane.org@namesys.com>
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

My fileserver quit. It's root partiton is missing one superblock. 

Normally, fsck would be able to use a backup superblock. But it
seems that reiserfsck is not capable of this. 

Now --rebuild-sb asks me for the version. I really wouldn't know. 

But i have a couple of other reiserfs partitions where I could gather
this info. Where can I find the version??? (Can I make debugreiserfs
print it? )

		Roger. 

