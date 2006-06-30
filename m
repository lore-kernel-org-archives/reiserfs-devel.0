From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 30 Jun 2006 09:33:53 -0700
Message-ID: <44A55271.7050501@namesys.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com> <1151612146.11510.4.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1151612146.11510.4.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>, Jeff Mahoney <jeffm@suse.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Mike Benoit wrote:

>
>This seems strange, because to me this type of workload would lend
>itself to being less fragmented then most workloads. All the box does is
>records TV programs, so over the course of 30-60min periods I would
>guess 95+% of the writes are sequential. 
>
>Why would the fragmentation be so bad? Is there a way to tell what the
>fragmentation rate is?
>
>Thanks.
>
>  
>
I wonder how the bitmap optimizations that Jeff added handle this usage
pattern.  Jeff?
