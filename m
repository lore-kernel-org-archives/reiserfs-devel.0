From: "Pysiak Satriani" <pysiak.satriani@wp.pl>
Subject: considerations for reiserfs with lots of files.
Date: Mon, 01 May 2006 14:55:55 +0200
Message-ID: <4456055bdae5b@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

Hi!

I am running a mail server that stores email on a 270G reiserfs 
partition in a Maildir format (one file per email message)

I have an account that is a kind of a tap and receives tremendous 
amounts of email. In just over 2 months I have 233k email 
messages, ie. 233k files in one directory!

Now, the obvious thing is that accessing that directory takes 
some time, I understand that, but I am having other problems with 
it. Since creating that account I started having strange problems 
like:
- files impossible to delete/read/rename (well actually I found 
one like that)
- reiserfsck --fix-fixable told me that it found some nodes that 
need --rebuild-tree
- I had an reiserfs related oops, unfortunately It did not save 
to the log.

So my question is, are there any special considerations for 
reiserfs with huge directories?

I am running 2.6.16.11, the partition is mounted exec,dev,suid,
rw,noatime,notail,iocharset=iso8859-2

It is qmail and courier-imap that operate on these maildir 
accounts.

Best regards,
Maciej




