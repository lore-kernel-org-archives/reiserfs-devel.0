From: Fred Schaettgen <kde.sch@ttgen.net>
Subject: Re: problem with reiser4
Date: Tue, 1 Mar 2005 20:07:53 +0100
Message-ID: <200503012007.53428.kde.sch@ttgen.net>
References: <4224BA6B.7040402@iparadigms.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4224BA6B.7040402@iparadigms.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 01 March 2005 19:54, fitzboy wrote:
> Hello all,
> I'm just switching from 2.4/reiser3 to 2.6/reiser4 on the first batch of
> machines. We are running a bunch of apple xRAIDs connected to Dell
> servers running Debian. we have the 2.6.10-mm kernel and we can make the
> reiser4 partitions, but there is a lot of lost space somewhere. If I
> create a reiser3 or xfs partition, I get 1.1T, but with reiser4 I can't
> get above 984GB. That is too much of a jump to be explained by overhead,
> so something is wrong... any thoughts?

I'm not an expert, but isn't the free space just a a rough estimation? You 
can't know in advance what the average file size will be etc. Maybe reiser4 
is just more conservative. What matters is how much data is actually stored 
on the disk the moment it runs full.

Fred

-- 
Fred Schaettgen
kde.sch@ttgen.net
