From: Julian Hall <jules@acris.co.uk>
Subject: Reiserfs with standard journal found, but there was specified a journal
 dev
Date: Mon, 10 Mar 2003 19:03:18 +0000
Message-ID: <3E6CE176.5030906@acris.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

My FS never had an external journal device.  I've used 'dd' to transfer 
it to a different partition and am trying to get it to work, but I get 
the following messages from reiserfsck:

vengeance:~# reiserfsck --rebuild-sb /dev/hdc1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4
[...]
Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
super.c 228 rebuild_sb
Reiserfs with standard journal found, but there was specified a journal dev


Do I need to use the --no-journal-available option?  Or is it something 
else.  If I just run --check rather than anything else, it manages to 
check the journal OK, but then complains that --rebuild-tree didn't 
finish last time.

Any ideas?

Jules


