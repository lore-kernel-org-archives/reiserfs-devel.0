From: Edward Shishkin <edward@namesys.com>
Subject: Re: how to linking and traversing the inmemory tree
Date: Mon, 14 Mar 2005 14:04:08 +0300
Message-ID: <42356FA8.20904@namesys.com>
References: <20050313065817.13797.qmail@web30405.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050313065817.13797.qmail@web30405.mail.mud.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: siddharth kothari <sidkot@yahoo.com>
Cc: reiserfs-list@namesys.com

siddharth kothari wrote:

Hello

>hi. 
>i am trying to create an in-memory for Reiser4. from
>the code i understand the following:
>1) Znode is the inmemory representation of the actual
>node.
>2) children have pointers to thier parents and alsso
>maintain their position in parents.
>3) Znodes also have the de-limiting keys
>and other fields.
>
>now my questions are:
>
>1) from where do you start traversing the tree?
>  
>

 From root znode if the node of current position is unknown or got
changed (there is so-called 'seal technique' to understand this),
otherwise traversing is resolved just to per-node lookup.

>2) are these nodes actually linked in memory as they
>are in a tree.
>  
>

Yes, all the relations are the same

>3) once you get a key for a file how do u locate the
>lock where the data for that file is to be found.
>  
>

This is a business of main search procedure (see coord_by_key())

>you obviously compare with the de-limiting keys to get
>to the node then wat.... how do u reach any other
>level since there are no down pointers.
>
>regards,
>siddharth
>
>When I was small I thought everything was either
>Black or White,
>Good or Bad,
>But I grew up to find out everthing was just Grey....
>
>
>		
>__________________________________ 
>Do you Yahoo!? 
>Yahoo! Small Business - Try our new resources site!
>http://smallbusiness.yahoo.com/resources/ 
>
>
>  
>

