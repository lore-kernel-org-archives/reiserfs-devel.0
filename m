From: fitzboy <fitzboy@iparadigms.com>
Subject: problem with reiser4
Date: Tue, 01 Mar 2005 10:54:35 -0800
Message-ID: <4224BA6B.7040402@iparadigms.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello all,
I'm just switching from 2.4/reiser3 to 2.6/reiser4 on the first batch of 
machines. We are running a bunch of apple xRAIDs connected to Dell 
servers running Debian. we have the 2.6.10-mm kernel and we can make the 
reiser4 partitions, but there is a lot of lost space somewhere. If I 
create a reiser3 or xfs partition, I get 1.1T, but with reiser4 I can't 
get above 984GB. That is too much of a jump to be explained by overhead, 
so something is wrong... any thoughts?

Tim
