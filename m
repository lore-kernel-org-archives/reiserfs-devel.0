From: siddharth kothari <sidkot@yahoo.com>
Subject: how to linking and traversing the inmemory tree
Date: Sat, 12 Mar 2005 22:58:17 -0800 (PST)
Message-ID: <20050313065817.13797.qmail@web30405.mail.mud.yahoo.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi. 
i am trying to create an in-memory for Reiser4. from
the code i understand the following:
1) Znode is the inmemory representation of the actual
node.
2) children have pointers to thier parents and alsso
maintain their position in parents.
3) Znodes also have the de-limiting keys
and other fields.

now my questions are:

1) from where do you start traversing the tree?
2) are these nodes actually linked in memory as they
are in a tree.
3) once you get a key for a file how do u locate the
lock where the data for that file is to be found.

you obviously compare with the de-limiting keys to get
to the node then wat.... how do u reach any other
level since there are no down pointers.

regards,
siddharth

When I was small I thought everything was either
Black or White,
Good or Bad,
But I grew up to find out everthing was just Grey....


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Small Business - Try our new resources site!
http://smallbusiness.yahoo.com/resources/ 
