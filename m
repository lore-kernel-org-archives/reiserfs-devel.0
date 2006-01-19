From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: vs-4080
Date: Wed, 18 Jan 2006 18:09:36 -0700
Message-ID: <1137632976.6573.7.camel@tribesman.namesys.com>
References: <200601111109.09437.rmeijer@internet.gr>
	 <1137533541.6375.76.camel@tribesman.namesys.com>
	 <200601171711.38508.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601171711.38508.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-01-17 at 17:11 +0200, Raymond A. Meijer wrote:
> On Tue 17 Jan 2006 23:32, Vladimir V. Saveliev wrote:
> 
> Hi Vladimir,
> 
> > > ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block
> > > (dm-8:46707368)[dev:blocknr]: bit already cleared
> 
> > This indicated a corruption in disk space allocation bitmap: used block
> > was marked as free.
> 
> I see..
> 
> > Am I correct that you got only one such message?
> 
> Yes, only one.
> 
> > Do you run reiserfsck regularly on that filesystem?
> 
> I hadn't run it for several months indeed...
> 
> Should I run it more often?
> 
> 

It would be interesting to check the filesystem after a week of regular
load to see whether new such corruptions appeared.

