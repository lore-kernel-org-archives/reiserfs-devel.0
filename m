From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: "df -i" support
Date: Thu, 13 May 2004 13:19:06 +0400
Message-ID: <1084439945.14090.6209.camel@tribesman.namesys.com>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miguel <turtle.power@wanadoo.es>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-05-13 at 11:34, Miguel wrote:
> Hi
> We have several machines running as MTA's using reiser for the mail
> queue, we usually check the number of files (well an approximation)
> using the output of "df -i" command on our monitorization plugins this
> may be not very acurate but is very fast and didn't affect the MTA's
> work.
> 
> With reiser the output of df -i is no longer usable,

IIRC, reiserfs always reported -1 as a total number of inodes and a
number of free inodes.
At whihc kernel it was useable for you?

>  we changed this to
> "find | wc -l" variations but it hurts the performance.
> 
> There's a command to count the number of leafs (that's the name?) of a
> tree from a reiser partition? or other orientative value?.(we mount
> with notail)
> 
> Tnx

