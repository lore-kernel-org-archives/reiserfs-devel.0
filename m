From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: My Reiser4 benchmark
Date: Mon, 25 Oct 2004 17:31:00 +0400
Message-ID: <1098711059.1637.113.camel@tribesman.namesys.com>
References: <417A821A.7000004@namesys.com>
	 <200410251504.06099.malcolm.agnew@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200410251504.06099.malcolm.agnew@t-online.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: malcolm.agnew@t-online.de
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-10-25 at 17:04, Malcolm Agnew wrote:
> I thought my personal benchmark might interest some of you. Attached is a plot 
> of running a simulation of a commercial wholesale application.

Hmm, I see nothing attached

> 
> Each iteration in the plot is a complex transaction (i.e. place an order for a 
> (possibly new) customer). The Y-axis says "transactions / second" but should 
> really read "single data base action / second", where access is "read", 
> "write" or "update" a record. The X-axis is one point per1000 iterations. 
> 
> At the beginning of the simulation there are about 1 MB of data (in 16 files). 
> At the end of the 200000 iterations there are about 750 MB of data.
> 

How much RAM is there?

> Reiser4 is considerably faster than Reiser3. Puzzling is that the advantage 
> decreases somewhat as the data grows.
> 
> Most puzzling is the yellow line "ReiserXXX" which is considerably better than 
> the line labled "ReiserFS". "ReiserXXX" is, wait for it, "Reiser3" on a 2.6.5 
> kernel. Is it well known that 2.6.9 is slower than 2.6.5?
> 

Would you please test for reiserfs under the same kernel?

> Any comments welcome.
> 
> Malcolm Agnew
> 
> p.s. The data base engine is my own.
> 
> 

