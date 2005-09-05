From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Incite into reiser5?
Date: Mon, 5 Sep 2005 13:02:50 +0400
Message-ID: <17180.2490.666358.984560@gargle.gargle.HOWL>
References: <1125596442.5207.11.camel@jove>
	<b14e81f0050901193220855450@mail.gmail.com>
	<1125685758.9150.8.camel@jove>
	<43189B26.2030602@slaphack.com>
	<873bonuurh.fsf@evinrude.uhoreg.ca>
	<4318AB3B.1090204@slaphack.com>
	<dfacls$4pd$2@sea.gmane.org>
	<4318C9E8.80804@slaphack.com>
	<dfaihh$m2d$1@sea.gmane.org>
	<4318EA2E.5090603@slaphack.com>
	<dfbofh$q51$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dfbofh$q51$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lexington Luthor <lexington.luthor@gmail.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Lexington Luthor writes:
 > David Masover wrote:
 > > Great -- no load balancing or local caching at all, then?
 > > 
 > 
 > Its actually pretty fast - almost raw disk speed for small clusters, but 
 > not much slower for larger ones - try it out.

Lustre and GFS target quite different environments. GFS is mainly for
small-to-medium clusters with up to hundred nodes, for situations when
one needs fail-over and things like that. Lustre is for the large
clusters with tens thousand nodes, hundreds object stores, with very
fa{,s}t transports both through the network (elan) and to the storage
(FC). This requires completely different architecture of IO and
meta-data management.

 > 
 > Its not as fast as reiser5 may end up, but its here and working right 
 > now. It is load balanced, and it does local caching. Use it before you 
 > start criticizing it.
 > 
 > It has plenty of its own problems (mainly relating to the DLM), but none 
 > of the things you mentioned are a problem.
 > 
 > For the time being, it beats every other non-commercial distributed file 
 > system hands down.
 > 
 > I look forward to reiser5, but GFS is just fine for now.
 > 
 > LL
 > 

Nikita.

 > 
