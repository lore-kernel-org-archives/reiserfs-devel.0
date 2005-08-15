From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 16:25:37 +0400
Message-ID: <430089C1.302@namesys.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050815115310.GA28630@tranquility.scriptkitchen.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payal Rathod <payal-reiserfs@scriptkitchen.com>
Cc: reiserfs-list@namesys.com

Hello

Payal Rathod wrote:
> Hi,
> I have been reading about journalling filesystems but still don't get 
> where exactly the journal is kept phyically on the harddisk. Can anyone 
> help me with basics of this?
> 

Each journaling filesystem keeps its journal by its own way.
In reiserfs by default journal is kept in statically pre-allocated on mkfs time 8192 blocks (4096 bytes each) starting from 18-th block.


