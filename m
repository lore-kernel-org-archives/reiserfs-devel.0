From: Oleg Drokin <green@namesys.com>
Subject: Re: lvm array --> what if one HD fails
Date: Mon, 22 Jul 2002 14:30:05 +0400
Message-ID: <20020722143005.A28242@namesys.com>
References: <5.0.2.1.2.20020722111528.01cf4640@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <5.0.2.1.2.20020722111528.01cf4640@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

   You should read LVM docs perhaps, most probably LVM won't come up
   so only first HDD will be available for repair.
   If you would be able to bring back the LVM, and first dist (usually holding
   the metadata) is ok, you would be able to restore most of the data from
   not failed disks.

Bye,
    Oleg
On Mon, Jul 22, 2002 at 12:19:54PM +0100, Newsmail wrote:
> I have an lvm array with many HDs one after the other. it is a simple 
> linear array, no striping. what happens if one HD dies and I remove it from 
> the array? could reiserfsck correct this? what happens to the metadata? as 
> I know it lies all over the space because of the tree structure. could this 
> be corrected? :)
> regards,
> greg
> 
> 
> 
