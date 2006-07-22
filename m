From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 18:49:27 -0600
Message-ID: <44C17617.5040303@namesys.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com> <1153514509.6659.41.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153514509.6659.41.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Mike Benoit wrote:

>
>On top of that, I don't see how a repacker would help these work loads
>much as the files usually have a high churn rate. 
>
I think Reiserfs is used on a lot more than squid servers.  For them,
80% of files don't move for long periods of time is the usual industry
statistic....
