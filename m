From: malcolm.agnew@t-online.de (Malcolm Agnew)
Subject: My Reiser4 benchmark
Date: Mon, 25 Oct 2004 15:04:06 +0200
Message-ID: <200410251504.06099.malcolm.agnew@t-online.de>
References: <417A821A.7000004@namesys.com>
Reply-To: malcolm.agnew@t-online.de
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_GnPfBVtdG+sAwky"
Return-path: <reiserfs-list-return-22171-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417A821A.7000004@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_GnPfBVtdG+sAwky
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I thought my personal benchmark might interest some of you. Attached is a plot 
of running a simulation of a commercial wholesale application.

Each iteration in the plot is a complex transaction (i.e. place an order for a 
(possibly new) customer). The Y-axis says "transactions / second" but should 
really read "single data base action / second", where access is "read", 
"write" or "update" a record. The X-axis is one point per1000 iterations. 

At the beginning of the simulation there are about 1 MB of data (in 16 files). 
At the end of the 200000 iterations there are about 750 MB of data.

Reiser4 is considerably faster than Reiser3. Puzzling is that the advantage 
decreases somewhat as the data grows.

Most puzzling is the yellow line "ReiserXXX" which is considerably better than 
the line labled "ReiserFS". "ReiserXXX" is, wait for it, "Reiser3" on a 2.6.5 
kernel. Is it well known that 2.6.9 is slower than 2.6.5?

Any comments welcome.

Malcolm Agnew

p.s. The data base engine is my own.



--Boundary-00=_GnPfBVtdG+sAwky--
