From: Jeremy West <jkwest@gmail.com>
Subject: reiser4 and reiserfs co-existence?
Date: Mon, 8 Nov 2004 11:55:56 -0500
Message-ID: <b28a886104110808555d3f59dc@mail.gmail.com>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

HI,

I'm new to the list.  I've taken the plunge and tasted the speed of
reiser4.  Excellent work.  I think I've stumbled upon a bug though.  I
have another partition formatted as reiserfs 3.6.  When I mount this
partition and listen to music from it, my reiser4 / partition stops
responding.  I mean every command I issue to the kernel results in a
segmentation fault.  Has anyone else had this problem?

I'm using redeeman-sources, based on mm-sources patch set.
-- 
Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
