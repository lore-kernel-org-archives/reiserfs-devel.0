From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Sat, 7 Jun 2003 22:20:20 -0700 (PDT)
Message-ID: <20030608052020.52835.qmail@web40014.mail.yahoo.com>
References: <3EDDBEA1.6040708@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDDBEA1.6040708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Cc: Kevin Bealer <kevinbealer@yahoo.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, reiserfs-list@namesys.com


In this case you would have a tree with only a level 3
node.  The levels are only used during insertion.  If
a level 2 node was later added, it would be added
under the level 3 node.

The level is not determined by the key, but chosen
randomly.  Half of the nodes are given level 0, half
of the remaining are given level 1, etc.

(I am talking about my algorithm here.)

Kevin

--- Hans Reiser <reiser@namesys.com> wrote:
> So if I understand right, the level is determined by
> what the key is.  
> Suppose that for key K the determined level is 3,
> but there are no other 
> records in the tree?  Is K then stored at a node at
> level 1 until such 
> time as a level 1 key is created for it to be
> attached to, or does one 
> create empty level 1 and level 2 nodes?
> 
> -- 
> Hans
> 
> 


__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com
