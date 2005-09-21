From: Hans Reiser <reiser@namesys.com>
Subject: Re: latest patches degrade reiser4 performance substantially
Date: Wed, 21 Sep 2005 12:17:00 -0700
Message-ID: <4331B1AC.6060000@namesys.com>
References: <4331A9BD.5030006@namesys.com> <20050921115256.6a11ab8d.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050921115256.6a11ab8d.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>, vs <vs@thebsh.namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Andrew Morton wrote:

>Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>At the this time we have no idea which patch is responsible, probably in
>>a day or two we'll have a patch to fix it.
>>
>>    
>>
>
>OK.  I assume this performance change is demonstrable in just
>2.6.14-rc2+reiser4?  Beware that there are other changes in the -mm lineup
>which might cause regressions.  Notably
>
>	mm-try-to-allocate-higher-order-pages-in-rmqueue_bulk.patch
>
>and
>
>	per-task-predictive-write-throttling-1.patch
>	per-task-predictive-write-throttling-1-tweaks.patch
>
>
>
>  
>
 I'll have vs check to make sure it is reiser4 changes causing the
drop.  Thanks much for the suggestion we check that.
