From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Our introduction to Reiser-list
Date: Tue, 25 Oct 2005 15:58:13 -0700
Message-ID: <200510251558.13860.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: ycoady@cs.uvic.ca, "Nordman, Ryan" <spacerobots@gmail.com>, huaning@uvic.ca

Hello all,

I'm a student at the University of Victoria. Between myself and a few fellow 
students we have embarked on a quest to do some experiments with the Reiser4 
metadata system to show it off and provide some real world use cases.

We'll be spending lots of time on this project between now and the end of the 
year. If list members have ideas for interesting experiments, please, join in 
and suggest them.

So far, we have a few nifty ideas:

1) tie the 'extract' utility to a shell script to copy existing metadata down 
into the filesystem

2) create a (very slow) shell which operates on the filesystem by xpath query. 
doing it right would be difficult, but faking it should be easy.

We are all inexperienced with kernel hacking and will probably ask some stupid 
questions as we go forward. Our individual interests vary and we may find 
that we have bitten off more than we can chew, but I expect it will be an 
interesting ride, if nothing else. 

Our first contribution will be a practical guide to installing Reiser4 (with 
metadata enabled) under Ubuntu 5.10. 

All the best,
-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
