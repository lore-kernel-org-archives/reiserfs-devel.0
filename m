From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: binary treaps
Date: Wed, 7 May 2003 14:42:45 -0700 (PDT)
Message-ID: <20030507214245.73383.qmail@web40013.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On the namesys homepage, there is a statement that
skip lists
would be very good for directory contents but the node
size
varies.

I wrote a balanced tree algorithm that works about
like a skip
list but does not have variable node size.  I started
with the 'skip
list' algorithm and developed a tree algorithm based
on it.

After developing this, I found an algorithm which is
similar, called a 'treap', although they use an
insert-then-rotate, and
my version does the insert in one downward pass.

I don't know enough about reiserfs's internals but I
can send the
tree algorithm description and code if anyone wants to
see it.

Kevin Bealer



__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
