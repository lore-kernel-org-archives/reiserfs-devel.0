From: Payal Rathod <payal-reiserfs@scriptkitchen.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 08:50:25 -0400
Message-ID: <20050815125025.GA29390@tranquility.scriptkitchen.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com> <430089C1.302@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <430089C1.302@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Aug 15, 2005 at 04:25:37PM +0400, Vladimir V. Saveliev wrote:
> Each journaling filesystem keeps its journal by its own way.
> In reiserfs by default journal is kept in statically pre-allocated on mkfs 
> time 8192 blocks (4096 bytes each) starting from 18-th block.

Is it kept in some sort of file? I mean can I see the file contents 
using normal UNIX tools? If yes how do I do it?

With warm regards,
-Payal
