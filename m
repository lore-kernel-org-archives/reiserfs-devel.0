From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: NFS issues
Date: Sun, 28 Mar 2004 03:13:17 +0200
Message-ID: <6.0.1.1.2.20040328031109.01f05328@pop.tvnet.hu>
References: <000201c41454$401eb860$50bc723e@ramy>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000201c41454$401eb860$50bc723e@ramy>
References: <000201c41454$401eb860$50bc723e@ramy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Ramy M. Hassan" <ramy@gawab.com>
Cc: reiserfs-list@namesys.com

it is fixed since a so big while. there is no nfs corruptions with nfsv3 at 
least for 2.4.x kernels, I dont think there are any problems with 2.6 neither.
where do you read that reiser3 has such problems? how old are those posts?
cheers,
greg
At 01:35 AM 3/28/2004, you wrote:
>I am currently using xfs on a very busy NFS server where stability, and
>performance are the main concerns. I started to benchmark reiser3 and
>found it outperforming xfs when I tune the file size to the average file
>size in my system ( my system deals with too many writes of relatively
>small files ). Apparently I will gain performance if I moved to reiser3,
>but I read on the web that there are data corruption problems when
>reiser is used with NFS, Is that fixed or not yet?
>
>Thanks in advance


